import 'package:flutter/material.dart';
import 'package:test_flutter_movie_db/features/features.dart';

class ListViewActors extends StatelessWidget {
  const ListViewActors({
    super.key,
    required this.actors,
  });
  final List<Character> actors;

  @override
  Widget build(BuildContext context) {
    if (actors.isEmpty) {
      return const Center(child: Text('No result found'));
    }
    return ListView.separated(
      itemCount: actors.length,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      separatorBuilder: (_, index) => ActorItem(actor: actors[index]),
      itemBuilder: (_, __) => const SizedBox(height: 8),
    );
  }
}
