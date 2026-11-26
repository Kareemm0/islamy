import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/hadith_item_entity.dart';

class HadithItemCard extends StatelessWidget {
  const HadithItemCard({
    super.key,
    required this.bookName,
    required this.item,
  });

  final String bookName;
  final HadithItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surfaceContainer),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Text(
                  '$bookName • حديث رقم ${item.number}',
                  style: AppTheme.text(
                    size: 11,
                    weight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                tooltip: 'نسخ الحديث',
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.copy_rounded,
                  size: 18,
                  color: AppColors.onSurfaceVariant,
                ),
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: item.arabic),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('تم نسخ الحديث رقم ${item.number}'),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDF7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.goldLight.withValues(alpha: 0.35),
              ),
            ),
            child: Text(
              item.arabic,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: AppTheme.arabic(
                size: 21,
                weight: FontWeight.w700,
                color: AppColors.onSurface,
                height: 38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
