import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_movie_db/core/core.dart';
import 'package:test_flutter_movie_db/features/home/home.dart';

class MovieDBApp extends StatelessWidget {
  const MovieDBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ITheMovieDBDataSource>(
          create: (_) => TheMovieDBDataSource(),
        ),
        RepositoryProvider<IActorRepository>(
          create: (context) => ActorRepository(context.read()),
        ),
      ],
      child: MaterialApp(
        title: 'Start Wars',
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
