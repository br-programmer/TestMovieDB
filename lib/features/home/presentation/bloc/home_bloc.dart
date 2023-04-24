import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_flutter_movie_db/features/features.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState, this._actorRepository) {
    on<_LoadActors>(_loadActorsToState);
  }
  final IActorRepository _actorRepository;

  Future<void> _loadActorsToState(
    _LoadActors _,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    final result = await _actorRepository.getActor();
    result.when(
      left: (_) => emit(const HomeState.error()),
      right: (actors) => emit(HomeState.loaded(actors: actors)),
    );
  }
}
