import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamy/core/di/injection_container.dart';
import 'package:islamy/core/notifications/salawat_reminder_service.dart';
import 'package:islamy/core/router/routes.dart';
import 'package:islamy/core/theme/app_theme.dart';

/// Settings tab featuring the "صلِّ على محمد" voice reminder feature.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<void> _openSalawatPage() async {
    await context.pushNamed(Routes.salawatReminderName);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final service = sl<SalawatReminderService>();
    final selectedMinutes = service.selectedMinutes;

    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
          children: [
            SizedBox(
              height: 56,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'إسلامي',
                        style: AppTheme.arabic(
                          size: 16,
                          weight: FontWeight.w700,
                          color: AppColors.gold,
                          height: 20,
                        ),
                      ),
                      Text(
                        'الإعدادات',
                        style: AppTheme.text(
                          size: 12,
                          weight: FontWeight.w600,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Featured "صلِّ على محمد" reminder card
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              elevation: 0.5,
              shadowColor: Colors.black12,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: _openSalawatPage,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.goldLight.withValues(alpha: 0.5),
                      width: 1.2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.campaign_rounded,
                          color: AppColors.goldAccent,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'صلِّ على محمد',
                                  style: AppTheme.arabic(
                                    size: 20,
                                    weight: FontWeight.w700,
                                    color: AppColors.primary,
                                    height: 26,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selectedMinutes != null
                                        ? AppColors.mint
                                        : AppColors.surfaceLow,
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: Text(
                                    selectedMinutes != null
                                        ? 'كل $selectedMinutes دقائق'
                                        : 'غير مفعل',
                                    style: AppTheme.text(
                                      size: 11,
                                      weight: FontWeight.w700,
                                      color: selectedMinutes != null
                                          ? AppColors.primary
                                          : AppColors.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'تنبيه صوتي «صلِّ على محمد» كل 5 إلى 30 دقيقة',
                              style: AppTheme.text(
                                size: 12,
                                color: AppColors.onSurfaceVariant,
                                height: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
