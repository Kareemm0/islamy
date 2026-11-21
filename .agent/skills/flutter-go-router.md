---
name: flutter-go-router
description: Set up and use the go_router package for navigation in Flutter apps. Adds the go_router dependency, keeps all route paths/names in a separate file called routes.dart and the GoRouter configuration in a separate file called app_router.dart, and wires it into MaterialApp.router. Use this skill whenever the user mentions routing, navigation, routes, go_router, "gouter", screens/pages navigation, deep links, redirects, or when adding a new page or feature that needs to be reachable, even if they don't name the package.
---

# Flutter Navigation with go_router

All navigation in the app uses **go_router**. Never use `Navigator.push`/`pushNamed` directly, and never hardcode path strings outside `routes.dart`.

## 1. Add the dependency (do this first, once)

Run in the project root so the latest compatible version is resolved:

```bash
flutter pub add go_router
```

If Flutter isn't available in the environment, add `go_router:` under `dependencies:` in `pubspec.yaml` with a current version from pub.dev (check pub.dev rather than guessing), and tell the user to run `flutter pub get`. Skip if `go_router` is already in `pubspec.yaml`.

## 2. File layout

Create these two separate files in `lib/core/router/` (create the folder if missing; it belongs to `core/` in the feature-based structure):

```
lib/core/router/
├── routes.dart        # route paths + names ONLY (constants)
└── app_router.dart    # GoRouter configuration ONLY
```

Do not put route constants in `app_router.dart`, and do not put router config in `routes.dart`.

### routes.dart

One entry per route, with a path and a name. Use a private constructor so it can't be instantiated.

```dart
abstract final class Routes {
  // Splash
  static const splash = '/';

  // Auth
  static const login = '/login';
  static const loginName = 'login';

  // Nested example: /products/:id
  static const products = '/products';
  static const productDetails = ':id';      // child segment
  static const productDetailsName = 'product-details';
}
```

Conventions:
- Top-level paths start with `/`; child routes use only the segment (no leading slash).
- Every route used with `context.goNamed` has a `...Name` constant; path params and query params are passed via the `pathParameters` / `queryParameters` arguments, never string-concatenated.
- Keep the file grouped by feature with a comment header per group.

### app_router.dart

```dart
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import 'routes.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.login,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.login,
        name: Routes.loginName,
        builder: (context, state) => const LoginPage(),
      ),
      // GoRoute(
      //   path: Routes.products,
      //   name: Routes.productsName,
      //   builder: (context, state) => const ProductsPage(),
      //   routes: [
      //     GoRoute(
      //       path: Routes.productDetails,
      //       name: Routes.productDetailsName,
      //       builder: (context, state) =>
      //           ProductDetailsPage(id: state.pathParameters['id']!),
      //     ),
      //   ],
      // ),
    ],
    // errorBuilder: (context, state) => const NotFoundPage(),
    // redirect: (context, state) { ... }   // auth guards
  );
}
```

Rules for this file:
- Builders return a single page class instance, never inline widget trees or helper functions (see `flutter-widget-rules` skill if present).
- Pages live in `lib/features/FEATURE_NAME/presentation/pages/`; import them here.
- Use `ShellRoute` / `StatefulShellRoute` for persistent bottom navigation.
- Auth guards go in `redirect`; do not scatter checks inside pages.
- For an error/404 screen, create a page widget in `core/widgets/` or a feature and set `errorBuilder`.

## 3. Wire it into the app

In `main.dart` (or `app.dart`), use `MaterialApp.router`, not `MaterialApp`:

```dart
MaterialApp.router(
  routerConfig: AppRouter.router,
)
```

## 4. Navigating

```dart
context.go(Routes.login);                         // replace stack
context.push(Routes.products);                    // push on stack
context.goNamed(Routes.productDetailsName,
    pathParameters: {'id': product.id});
context.pop();
```

## 5. Workflow when adding a page

1. Create the page widget in the feature's `presentation/pages/` (own file, StatelessWidget).
2. Add its path (and name) constants to `routes.dart`.
3. Register a `GoRoute` in `app_router.dart` using those constants.
4. Navigate to it with `context.go/push/goNamed` using the constants.

If the user asks to change or add a route, always touch these two files rather than navigating ad hoc. If the project still uses `Navigator` or `MaterialApp(home: ...)`, migrate it to this setup and say what you changed.
