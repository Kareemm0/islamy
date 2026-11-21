import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../cubit/azkar_cubit.dart';
import '../cubit/azkar_state.dart';
import 'azkar_style.dart';

class AzkarTasbihSheet extends StatelessWidget {
  const AzkarTasbihSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AzkarCubit>();
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Electronic Tasbih • المسبحة',
                style: AppTheme.text(
                  size: 18,
                  weight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: cubit.incrementTasbih,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: AzkarPalette.emerald,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${state.tasbihBeads} / 33',
                    style: AppTheme.text(
                      size: 24,
                      weight: FontWeight.w700,
                      color: AppColors.goldAccent,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: cubit.resetTasbih,
                child: Text(
                  'Reset',
                  style: AppTheme.text(
                    size: 13,
                    weight: FontWeight.w600,
                    color: AppColors.gold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
