import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/di/injection_container.dart';

import '../cubit/bookmark_cubit.dart';
import '../cubit/surah_details_cubit.dart';
import '../cubit/surah_details_state.dart';
import '../widgets/surah_details_body.dart';

/// Displays a single Surah and its Ayahs loaded from `GET /v1/surah/:id`.
class SurahDetailsPage extends StatelessWidget {
  const SurahDetailsPage({
    super.key,
    required this.surahId,
    this.initialPage,
  });

  final int surahId;
  final int? initialPage;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SurahDetailsCubit>(
          create: (_) => sl<SurahDetailsCubit>()..loadSurah(surahId),
        ),
        BlocProvider<BookmarkCubit>.value(value: sl<BookmarkCubit>()),
      ],
      child: BlocBuilder<SurahDetailsCubit, SurahDetailsState>(
        builder: (context, state) => SurahDetailsBody(
          surahId: surahId,
          initialPage: initialPage,
          state: state,
        ),
      ),
    );
  }
}
