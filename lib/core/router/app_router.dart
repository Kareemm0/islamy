import 'package:go_router/go_router.dart';

import '../../features/azkar/presentation/pages/azkar_page.dart';
import '../../features/hadith/presentation/pages/hadith_details_page.dart';
import '../../features/hadith/presentation/pages/hadith_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/quran/presentation/pages/quran_page.dart';
import '../../features/quran/presentation/pages/surah_details_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../widgets/app_shell.dart';
import 'routes.dart';

/// Application GoRouter configuration.
abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                name: Routes.homeName,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.quran,
                name: Routes.quranName,
                builder: (context, state) => const QuranPage(),
                routes: [
                  GoRoute(
                    path: Routes.surahDetails,
                    name: Routes.surahDetailsName,
                    builder: (context, state) => SurahDetailsPage(
                      surahId: int.parse(state.pathParameters['id']!),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.azkar,
                name: Routes.azkarName,
                builder: (context, state) => const AzkarPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.hadith,
                name: Routes.hadithName,
                builder: (context, state) => const HadithPage(),
                routes: [
                  GoRoute(
                    path: Routes.hadithDetails,
                    name: Routes.hadithDetailsName,
                    builder: (context, state) => HadithDetailsPage(
                      slug: state.pathParameters['slug']!,
                      initialBookName: state.uri.queryParameters['name'],
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.settings,
                name: Routes.settingsName,
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
