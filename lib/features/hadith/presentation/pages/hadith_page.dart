import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/di/injection_container.dart';
import 'package:islamy/core/theme/app_theme.dart';
import 'package:islamy/features/hadith/presentation/cubit/hadith_cubit.dart';
import 'package:islamy/features/hadith/presentation/cubit/hadith_state.dart';
import 'package:islamy/features/hadith/presentation/widgets/hadith_page_body.dart';

/// Hadith tab: collections & books.
class HadithPage extends StatelessWidget {
  const HadithPage({super.key});

  void _snack(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void _handleFilterTap(BuildContext context) {
    final cubit = context.read<HadithCubit>();
    cubit.toggleSahihOnly();
    _snack(
      context,
      cubit.state.sahihOnly
          ? 'عرض كتب الصحيح فقط'
          : 'عرض جميع المجموعات الحديثية',
    );
  }

  void _handleCopy(BuildContext context) {
    final cubit = context.read<HadithCubit>();
    final h = cubit.state.hadithOfDay;
    Clipboard.setData(ClipboardData(text: h.arabic));
    cubit.registerCopy();
    _snack(context, 'تم نسخ الحديث');
  }

  void _handleSave(BuildContext context) {
    final cubit = context.read<HadithCubit>();
    cubit.toggleSaved();
    _snack(context, cubit.state.saved ? 'تم حفظ الحديث' : 'تمت الإزالة');
  }

  void _handleShare(BuildContext context) =>
      _snack(context, 'المشاركة غير متاحة حاليًا');

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HadithCubit>(
      create: (_) => sl<HadithCubit>()..loadBooks()..startHadithRotation(),
      child: ColoredBox(
        color: AppColors.background,
        child: SafeArea(
          bottom: false,
          child: BlocBuilder<HadithCubit, HadithState>(
            builder: (context, state) => HadithPageBody(
              state: state,
              onQueryChanged: context.read<HadithCubit>().setQuery,
              onFilterTap: () => _handleFilterTap(context),
              onCopy: () => _handleCopy(context),
              onSave: () => _handleSave(context),
              onShare: () => _handleShare(context),
              onRetry: context.read<HadithCubit>().loadBooks,
            ),
          ),
        ),
      ),
    );
  }
}
