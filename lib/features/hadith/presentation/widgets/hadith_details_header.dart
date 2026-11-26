import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamy/core/theme/app_theme.dart';

class HadithDetailsHeader extends StatelessWidget {
  const HadithDetailsHeader({
    super.key,
    required this.bookName,
    required this.slug,
    required this.total,
    required this.currentPage,
    required this.totalPages,
  });

  final String bookName;
  final String slug;
  final int total;
  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 12),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      bookName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.text(
                        size: 20,
                        weight: FontWeight.w700,
                        color: Colors.white,
                        height: 26,
                      ),
                    ),
                    Text(
                      '$total حديث • صفحة $currentPage من $totalPages',
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
                  color: AppColors.goldAccent,
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Text(
                  bookName,
                  style: AppTheme.text(
                    size: 10,
                    weight: FontWeight.w700,
                    color: AppColors.gold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
