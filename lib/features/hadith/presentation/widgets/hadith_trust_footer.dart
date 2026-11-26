import 'package:flutter/material.dart';
import 'package:islamy/core/theme/app_theme.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_style.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_svg_icon.dart';

/// Trust / stats footer.
class HadithTrustFooter extends StatelessWidget {
  const HadithTrustFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final gold = AppTheme.text(
      size: 11,
      weight: FontWeight.w600,
      color: AppColors.gold,
      height: 16,
      letterSpacing: 0.44,
    );
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HadithPalette.footerBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.goldAccent.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: const HadithSvgIcon(
              name: 'footer_icon',
              width: 20.2,
              height: 19.25,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'أكثر من 34,000+ حديث نبوي موثق',
            textAlign: TextAlign.center,
            style: AppTheme.text(
              size: 15,
              weight: FontWeight.w700,
              color: AppColors.primary,
              height: 20,
              letterSpacing: 0.15,
            ),
          ),
          const SizedBox(height: 2),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: Text(
              'مكتملة بالنص العربي المشكول، وأحكام العلماء، والسند الكامل.',
              textAlign: TextAlign.center,
              style: AppTheme.text(
                size: 13,
                color: AppColors.onSurfaceVariant,
                height: 18,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 4,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const HadithSvgIcon(
                    name: 'authentic_chains',
                    width: 11.7,
                    height: 11.7,
                  ),
                  const SizedBox(width: 4),
                  Text('أسانيد موثقة', style: gold),
                ],
              ),
              Opacity(opacity: 0.4, child: Text('•', style: gold)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const HadithSvgIcon(
                    name: 'scholarly_gradings',
                    width: 12.8,
                    height: 9.3,
                  ),
                  const SizedBox(width: 4),
                  Text('تحقيقات العلماء', style: gold),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
