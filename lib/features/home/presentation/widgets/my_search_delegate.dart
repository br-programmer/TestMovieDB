import 'package:flutter/material.dart';
import 'package:test_flutter_movie_db/features/features.dart';

class MySeachDelegate extends SearchDelegate<void> {
  MySeachDelegate(this.actors);
  final List<Character> actors;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return result(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return result(context);
  }

  Widget result(BuildContext context) {
    final query = this.query.toLowerCase();
    return ListViewActors(
      actors: actors
          .where(
            (a) =>
                a.name.toLowerCase().contains(query) ||
                a.originalName.toLowerCase().contains(query) ||
                a.character.toLowerCase().contains(query),
          )
          .toList(),
    );
  }
}
