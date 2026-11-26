import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamy/core/di/injection_container.dart';
import 'package:islamy/core/notifications/salawat_reminder_service.dart';
import 'package:islamy/core/theme/app_theme.dart';

/// Screen where the user chooses the recurring interval (5..30 minutes)
/// for the "صلِّ على محمد" voice notification reminder.
class SalawatReminderPage extends StatefulWidget {
  const SalawatReminderPage({super.key});

  @override
  State<SalawatReminderPage> createState() => _SalawatReminderPageState();
}

class _SalawatReminderPageState extends State<SalawatReminderPage> {
  late final SalawatReminderService _service;
  int? _selectedMinutes;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _service = sl<SalawatReminderService>();
    _selectedMinutes = _service.selectedMinutes;
  }

  Future<void> _selectInterval(int minutes) async {
    setState(() {
      _selectedMinutes = minutes;
      _saving = true;
    });
    await _service.setIntervalMinutes(minutes);
    if (!mounted) return;
    setState(() => _saving = false);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            'تم تفعيل تذكير «صلِّ على محمد» كل $minutes دقائق حتى عند إغلاق التطبيق',
          ),
        ),
      );
  }

  Future<void> _disableReminder() async {
    setState(() {
      _selectedMinutes = null;
      _saving = true;
    });
    await _service.disable();
    if (!mounted) return;
    setState(() => _saving = false);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('تم إيقاف تذكير «صلِّ على محمد»')),
      );
  }

  Future<void> _testSound() async {
    await _service.playTestNotification();
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('تم إرسال التنبيه الصوتي للتجربة')),
      );
  }

  @override
  Widget build(BuildContext context) {
    final enabled = _selectedMinutes != null;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header banner
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary,
                      Color(0xFF0D5C3A),
                      AppColors.primaryContainer,
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1F004328),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Material(
                          color: Colors.white.withValues(alpha: 0.14),
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: () => context.pop(),
                            child: const SizedBox(
                              width: 38,
                              height: 38,
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'صلِّ على محمد ﷺ',
                                style: AppTheme.arabic(
                                  size: 24,
                                  weight: FontWeight.w700,
                                  color: AppColors.goldContainer,
                                  height: 30,
                                ),
                              ),
                              Text(
                                'تذكير صوتي دوري بالصلاة على النبي ﷺ',
                                style: AppTheme.text(
                                  size: 12,
                                  color: AppColors.mintSoft,
                                  height: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: enabled
                                ? AppColors.mint
                                : Colors.white.withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            enabled ? 'مُفعّل' : 'متوقف',
                            style: AppTheme.text(
                              size: 11,
                              weight: FontWeight.w700,
                              color: enabled ? AppColors.primary : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '«مَنْ صَلَّى عَلَيَّ صَلَاةً صَلَّى اللَّهُ عَلَيْهِ بِهَا عَشْرًا»',
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: AppTheme.arabic(
                              size: 20,
                              weight: FontWeight.w700,
                              color: Colors.white,
                              height: 34,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'رواه مسلم',
                            style: AppTheme.text(
                              size: 11,
                              weight: FontWeight.w600,
                              color: AppColors.goldContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Section heading
              Text(
                'اختر الفترة الزمنية للتذكير الصوتي',
                style: AppTheme.text(
                  size: 16,
                  weight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'سيعمل الصوت تلقائيًا في الخلفية وحتى بعد إغلاق التطبيق بدون عنوان أو نص إضافي.',
                style: AppTheme.text(
                  size: 12,
                  color: AppColors.onSurfaceVariant,
                  height: 18,
                ),
              ),
              const SizedBox(height: 14),

              // Interval options grid (5, 10, 15, 20, 25, 30 min)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: SalawatReminderService.supportedIntervals.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.75,
                ),
                itemBuilder: (context, index) {
                  final minutes =
                      SalawatReminderService.supportedIntervals[index];
                  final selected = _selectedMinutes == minutes;
                  return Material(
                    color: selected ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: _saving ? null : () => _selectInterval(minutes),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: selected
                                ? AppColors.goldAccent
                                : AppColors.surfaceContainer,
                            width: selected ? 2 : 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: selected
                                        ? Colors.white.withValues(alpha: 0.15)
                                        : AppColors.surfaceLow,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.notifications_active_rounded,
                                    size: 17,
                                    color: selected
                                        ? AppColors.goldAccent
                                        : AppColors.primary,
                                  ),
                                ),
                                if (selected)
                                  const Icon(
                                    Icons.check_circle_rounded,
                                    size: 20,
                                    color: AppColors.goldAccent,
                                  ),
                              ],
                            ),
                            Text(
                              'كل $minutes دقائق',
                              style: AppTheme.text(
                                size: 15,
                                weight: FontWeight.w700,
                                color: selected
                                    ? Colors.white
                                    : AppColors.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Test sound button
              FilledButton.icon(
                onPressed: _testSound,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.goldAccent,
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.volume_up_rounded),
                label: Text(
                  'تجربة الصوت الآن (صلِّ على محمد)',
                  style: AppTheme.text(
                    size: 14,
                    weight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),

              if (enabled) ...[
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _saving ? null : _disableReminder,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red.shade700,
                    side: BorderSide(color: Colors.red.shade200),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.notifications_off_rounded, size: 18),
                  label: Text(
                    'إيقاف التذكير الصوتي',
                    style: AppTheme.text(
                      size: 13,
                      weight: FontWeight.w700,
                      color: Colors.red.shade700,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
