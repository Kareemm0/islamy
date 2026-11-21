import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/di/injection_container.dart';
import 'package:islamy/core/theme/app_theme.dart';

import '../cubit/quran_cubit.dart';
import '../cubit/quran_state.dart';
import '../widgets/quran_body.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuranCubit>(
      create: (_) => sl<QuranCubit>()..loadSurahs(),
      child: ColoredBox(
        color: AppColors.background,
        child: SafeArea(
          bottom: false,
          child: BlocBuilder<QuranCubit, QuranState>(
            builder: (context, state) => QuranBody(state: state),
          ),
        ),
      ),
    );
  }
}
