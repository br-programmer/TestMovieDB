import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_movie_db/features/features.dart';
import 'package:test_flutter_movie_db/features/home/presentation/bloc/home_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (actors) => ListViewActors(actors: actors),
          error: () => const Text('error...'),
        );
      },
    );
  }
}
