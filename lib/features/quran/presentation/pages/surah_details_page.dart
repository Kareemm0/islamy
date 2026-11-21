import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/di/injection_container.dart';

import '../cubit/surah_details_cubit.dart';
import '../cubit/surah_details_state.dart';
import '../widgets/surah_details_body.dart';

/// Displays a single Surah and its Ayahs loaded from `GET /v1/surah/:id`.
class SurahDetailsPage extends StatelessWidget {
  const SurahDetailsPage({super.key, required this.surahId});

  final int surahId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SurahDetailsCubit>(
      create: (_) => sl<SurahDetailsCubit>()..loadSurah(surahId),
      child: BlocBuilder<SurahDetailsCubit, SurahDetailsState>(
        builder: (context, state) =>
            SurahDetailsBody(surahId: surahId, state: state),
      ),
    );
  }
}
