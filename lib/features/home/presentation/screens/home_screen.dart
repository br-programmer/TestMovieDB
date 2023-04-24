import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_movie_db/features/features.dart';
import 'package:test_flutter_movie_db/features/home/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        const HomeState.initial(),
        context.read(),
      )..add(const HomeEvent.loadedActor()),
      child: const HomeLayout(),
    );
  }
}

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Wars'),
        actions: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: SizedBox.shrink,
                loaded: (actors) => IconButton(
                  onPressed: () => showSearch(
                    context: context,
                    useRootNavigator: true,
                    delegate: MySeachDelegate(actors),
                  ),
                  icon: const Icon(Icons.search),
                ),
              );
            },
          ),
        ],
      ),
      body: const HomeBody(),
    );
  }
}
