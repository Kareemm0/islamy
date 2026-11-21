import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../cubit/azkar_cubit.dart';
import '../cubit/azkar_state.dart';
import '../widgets/azkar_body.dart';
import '../widgets/azkar_tasbih_sheet.dart';

/// Azkar - Morning & Evening tab.
class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  void _openTasbihSheet(BuildContext context) {
    final cubit = context.read<AzkarCubit>();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: const AzkarTasbihSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AzkarCubit(),
      child: ColoredBox(
        color: AppColors.background,
        child: BlocBuilder<AzkarCubit, AzkarState>(
          builder: (context, state) => AzkarBody(
            state: state,
            onOpenTasbih: () => _openTasbihSheet(context),
          ),
        ),
      ),
    );
  }
}
