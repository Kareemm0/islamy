import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/home_azkar_card.dart';
import '../widgets/home_hadith_card.dart';
import '../widgets/home_header.dart';
import '../widgets/home_prayer_card.dart';
import '../widgets/home_quran_goal_card.dart';
import '../widgets/home_reflection_banner.dart';
import '../widgets/home_shortcuts.dart';

/// Islamy Home Dashboard page.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: ColoredBox(
        color: AppColors.background,
        child: SafeArea(
          bottom: false,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final cubit = context.read<HomeCubit>();
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HomeHeader(state: state),
                    const SizedBox(height: 16),
                    HomePrayerCard(
                      state: state,
                      onToggleAthan: cubit.toggleAthan,
                    ),
                    const SizedBox(height: 20),
                    HomeAzkarCard(
                      state: state,
                      onSelectPeriod: cubit.selectPeriod,
                      onStartReading: cubit.startReadingAzkar,
                    ),
                    const SizedBox(height: 20),
                    HomeShortcuts(
                      state: state,
                      onIncrementTasbih: cubit.incrementTasbih,
                    ),
                    const SizedBox(height: 20),
                    HomeHadithCard(
                      state: state,
                      onToggleBookmark: cubit.toggleHadithBookmark,
                    ),
                    const SizedBox(height: 18),
                    HomeQuranGoalCard(
                      state: state,
                      onReadPage: cubit.readPage,
                    ),
                    const SizedBox(height: 18),
                    const HomeReflectionBanner(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
