import 'package:go_router/go_router.dart';

import '../../features/azkar/domain/entities/azkar_category.dart';
import '../../features/azkar/presentation/pages/azkar_page.dart';
import '../../features/hadith/presentation/pages/hadith_details_page.dart';
import '../../features/hadith/presentation/pages/hadith_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/qibla_page.dart';
import '../../features/quran/presentation/pages/quran_page.dart';
import '../../features/quran/presentation/pages/surah_details_page.dart';
import '../../features/settings/presentation/pages/salawat_reminder_page.dart';
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
                routes: [
                  GoRoute(
                    path: Routes.qibla,
                    name: Routes.qiblaName,
                    builder: (context, state) {
                      final deg = int.tryParse(
                        state.uri.queryParameters['deg'] ?? '',
                      );
                      return QiblaPage(initialQiblaDegrees: deg ?? 136);
                    },
                  ),
                ],
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
                    builder: (context, state) {
                      final pageStr = state.uri.queryParameters['page'];
                      return SurahDetailsPage(
                        surahId: int.parse(state.pathParameters['id']!),
                        initialPage:
                            pageStr == null ? null : int.tryParse(pageStr),
                      );
                    },
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
                builder: (context, state) {
                  final catName = state.uri.queryParameters['category'];
                  final category = AzkarCategory.values
                      .where((c) => c.name == catName)
                      .firstOrNull;
                  return AzkarPage(initialCategory: category);
                },
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
                routes: [
                  GoRoute(
                    path: Routes.salawatReminder,
                    name: Routes.salawatReminderName,
                    builder: (context, state) => const SalawatReminderPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
