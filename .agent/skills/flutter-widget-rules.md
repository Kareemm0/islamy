---
name: flutter-widget-rules
description: Strict rules for how Claude writes Flutter UI. Never create widgets as functions or methods (no `Widget _buildHeader()`); always make each widget its own StatelessWidget class in its own separate file. Common/reusable widgets go in lib/core/widgets/, widgets used by only one feature go in lib/features/FEATURE_NAME/presentation/widgets/. Use this skill whenever writing, editing, reviewing or refactoring ANY Flutter screen, page, widget, UI, layout or build method in Dart, whenever the user mentions widgets, "extract widget", "build method", "helper widget", or UI components, even if they don't mention these rules.
---

# Flutter Widget Rules

## Rule 1: Never use function widgets

Do not write widgets as functions, getters or methods that return `Widget`.

```dart
// WRONG - never generate any of these
Widget _buildHeader() => Text('Hi');
Widget get header => Text('Hi');
Widget buildCard(BuildContext context, String title) { ... }
final header = () => Text('Hi');
```

Always create a class instead:

```dart
// RIGHT
class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) => Text(title);
}
```

Why: classes get their own element/rebuild boundary, can be `const`, show up in DevTools, and are testable. Function widgets rebuild with the parent and defeat these benefits.

## Rule 2: One widget = one StatelessWidget in its own file

- Each widget class lives in **its own file**, named `snake_case` after the class: `HeaderText` -> `header_text.dart`.
- Never declare a second widget class in the same file as a page or another widget (including private `_Foo` classes).
- Use `StatelessWidget` by default. Use `StatefulWidget` only when the widget truly owns local mutable state (controllers, animations, focus nodes, etc.). Prefer lifting state to the state manager first.
- Give every widget a `const` constructor with `super.key` and `final` fields. Use `const` at call sites wherever possible.
- Pass data and callbacks through constructor parameters; do not pass `BuildContext` into helper functions to build UI.

## Rule 3: Where the file goes

Decide with one question: **is this widget used (or plausibly reusable) by more than one feature?**

| Answer | Location |
|---|---|
| Yes: generic UI such as buttons, text fields, loaders, dialogs, empty/error states, app bars, cards | `lib/core/widgets/` |
| No: tied to one feature's data or screen (e.g. `ProductPriceTag`, `LoginForm`) | `lib/features/<feature>/presentation/widgets/` |

Guidance for borderline cases:
- If it knows about a feature's entities/models/state, it is feature-specific even if it looks generic.
- If it takes only primitives, callbacks and `child`/`children` and has no feature knowledge, it is common.
- If a feature widget later gets needed by a second feature, move it to `core/widgets/` and update imports.
- Full-screen widgets (pages) go in `presentation/pages/`, not `widgets/`.
- Group core widgets in sub-folders only when there are many (e.g. `core/widgets/buttons/`).

Check that the folders exist (see the `flutter-clean-feature-architecture` skill for the base structure); create missing ones rather than placing files elsewhere. Add a `.dart` import in the parent file for each extracted widget.

## Workflow when writing UI

1. Sketch the widget tree and identify every distinct visual chunk (anything you'd be tempted to put in a `_build...` method).
2. For each chunk, decide common vs feature-specific (Rule 3), then create its own file with a StatelessWidget.
3. Compose them in the page's `build` method. The page should read like an outline of widget classes, with no `_build` helpers.
4. Before finishing, scan your output: no method/getter/closure returning `Widget` other than `build` (and builder callbacks required by framework APIs, e.g. `ListView.builder`'s `itemBuilder`, which should just return a widget class instance like `ProductTile(product: p)`).

## Workflow when refactoring existing code

When you see existing function widgets in code you're editing, convert them to classes following the rules above if they are within the scope of the change, and tell the user which files you created. If it would balloon the scope, mention it instead of silently rewriting everything.

## Allowed exceptions

- The `build` method itself.
- Framework-required builder callbacks (`itemBuilder`, `builder`, `errorBuilder`, `Route` builders), kept to a single line that returns a widget class.
- Top-level `main()`/`runApp(const MyApp())` setup.
