---
name: flutter-clean-feature-architecture
description: Scaffold and maintain a feature-based Clean Architecture folder structure for Flutter (Dart) apps, with a shared core/ folder (widgets, network, local_storage, notifications, errors, utils, constants, localization, di) and a features/ folder where every feature owns its own data, domain and presentation layers. Use this skill whenever the user mentions Flutter project structure, folder structure, clean architecture, feature-based / feature-first architecture, "core" folder, creating a new feature or module, or wants to organize lib/ - even if they don't say "skill" or "scaffold".
---

# Flutter Clean Architecture (Feature-Based)

Creates and extends this structure under `lib/`:

```
lib/
├── core/
│   ├── widgets/          # shared reusable UI (buttons, loaders, dialogs)
│   ├── network/          # http client (dio/http), interceptors, api endpoints, network info
│   ├── local_storage/    # shared_preferences / hive / secure storage wrappers
│   ├── notifications/    # push + local notifications setup and handlers
│   ├── errors/           # exceptions and failures
│   ├── utils/            # helpers, extensions, validators, formatters
│   ├── constants/        # app-wide constants (strings, keys, sizes)
│   ├── localization/     # l10n / translations
│   └── di/               # dependency injection (get_it / injectable)
└── features/
    └── <feature_name>/   # one folder per feature, each with 3 layers
        ├── data/
        │   ├── datasources/    # remote + local data sources
        │   ├── models/         # DTOs, fromJson/toJson, extend entities
        │   └── repositories/   # repository implementations
        ├── domain/
        │   ├── entities/       # pure Dart business objects
        │   ├── repositories/   # abstract repository contracts
        │   └── usecases/       # one class per business action
        └── presentation/
            ├── pages/          # screens
            ├── widgets/        # feature-specific widgets
            └── state/          #  cubit
```

## Workflow

1. **Starting a project / "make the structure"**: run the scaffold script with no feature names. This creates `core/` fully and an **empty** `features/` folder (the user wants the feature folder left empty until a feature is named).
2. **Adding a feature**: run the script with one or more snake_case feature names. Each gets its own three layers.
3. Confirm the target directory (default `lib`). Never overwrite existing files; the script only creates missing folders.

```bash
# base structure only (core + empty features/)
bash scripts/scaffold.sh lib

# base + features
bash scripts/scaffold.sh lib auth profile
```

Empty folders get a `.gitkeep` so Git tracks them.

## Dependency rules (explain these when relevant)

- `presentation` -> `domain` <- `data`. Domain depends on nothing (pure Dart, no Flutter imports).
- Features never import from other features' `data` or `presentation`. Share via `core/` or through domain contracts.
- `core/` never imports from `features/`.
- Models (data) extend or map to entities (domain); entities never know about JSON.
- Register each feature's dependencies in `core/di/` (or a per-feature `di` file called from it).

## Naming conventions

- Folders and files: `snake_case`. Feature names singular or domain-oriented (`auth`, `cart`, `profile`).
- Files: `<name>_page.dart`, `<name>_model.dart`, `<name>_entity.dart`, `<name>_repository.dart`, `<name>_repository_impl.dart`, `<verb>_<noun>_usecase.dart`, `<name>_remote_datasource.dart`.

## Customizing

If the user wants different core folders (e.g. `theme/`, `router/`), edit the `CORE_DIRS` array in `scripts/scaffold.sh`, or just create the extra folders and mention them. If they use a specific state manager, rename `presentation/state/` to `bloc/`, `cubit/`, `providers/`, etc.

## scripts/scaffold.sh

Save this as `scripts/scaffold.sh` next to the skill (or run it directly).

```bash
#!/usr/bin/env bash
# Usage: scaffold.sh <root_dir> [feature_name ...]
# Creates core/ and features/ under root_dir. Safe to re-run (never overwrites).
set -euo pipefail

ROOT="${1:-lib}"
shift || true

CORE_DIRS=(widgets network local_storage notifications errors utils constants localization di)
FEATURE_DIRS=(
  data/datasources data/models data/repositories
  domain/entities domain/repositories domain/usecases
  presentation/pages presentation/widgets presentation/state
)

mk() { mkdir -p "$1"; [ -z "$(ls -A "$1")" ] && touch "$1/.gitkeep" || true; }

for d in "${CORE_DIRS[@]}"; do mk "$ROOT/core/$d"; done
mkdir -p "$ROOT/features"; [ -z "$(ls -A "$ROOT/features")" ] && touch "$ROOT/features/.gitkeep" || true

for f in "$@"; do
  rm -f "$ROOT/features/.gitkeep"
  for d in "${FEATURE_DIRS[@]}"; do mk "$ROOT/features/$f/$d"; done
done

echo "Structure ready under $ROOT"
```
