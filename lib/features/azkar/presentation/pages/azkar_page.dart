import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/di/injection_container.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../../domain/entities/azkar_category.dart';
import '../cubit/azkar_cubit.dart';
import '../cubit/azkar_state.dart';
import '../widgets/azkar_body.dart';
import '../widgets/azkar_tasbih_sheet.dart';

/// Azkar - Morning & Evening tab.
class AzkarPage extends StatefulWidget {
  const AzkarPage({super.key, this.initialCategory});

  final AzkarCategory? initialCategory;

  @override
  State<AzkarPage> createState() => _AzkarPageState();
}

class _AzkarPageState extends State<AzkarPage> {
  late final AzkarCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = sl<AzkarCubit>()..loadAzkar();
    if (widget.initialCategory != null) {
      _cubit.selectCategory(widget.initialCategory!);
    }
  }

  @override
  void didUpdateWidget(covariant AzkarPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialCategory != null &&
        widget.initialCategory != oldWidget.initialCategory) {
      _cubit.selectCategory(widget.initialCategory!);
    }
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  void _openTasbihSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => BlocProvider.value(
        value: _cubit,
        child: const AzkarTasbihSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AzkarCubit>.value(
      value: _cubit,
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
