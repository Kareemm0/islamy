import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamy/core/di/injection_container.dart';

import '../cubit/hadith_details_cubit.dart';
import '../cubit/hadith_details_state.dart';
import '../widgets/hadith_details_body.dart';

/// Displays paginated hadiths for a chosen collection slug.
class HadithDetailsPage extends StatelessWidget {
  const HadithDetailsPage({
    super.key,
    required this.slug,
    this.initialBookName,
  });

  final String slug;
  final String? initialBookName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HadithDetailsCubit>(
      create: (_) => sl<HadithDetailsCubit>()
        ..loadInitial(slug: slug, initialName: initialBookName),
      child: BlocBuilder<HadithDetailsCubit, HadithDetailsState>(
        builder: (context, state) => HadithDetailsBody(state: state),
      ),
    );
  }
}
