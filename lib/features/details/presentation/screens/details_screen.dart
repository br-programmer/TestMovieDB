import 'package:flutter/material.dart';
import 'package:test_flutter_movie_db/core/core.dart';
import 'package:test_flutter_movie_db/features/features.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.actor});
  final Character actor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        automaticallyImplyLeading: false,
      ),
      body: DetailLayout(actor: actor),
      floatingActionButton: FloatingActionButton(
        onPressed: Navigator.of(context).pop,
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }
}

class DetailLayout extends StatelessWidget {
  const DetailLayout({
    super.key,
    required this.actor,
  });

  final Character actor;

  @override
  Widget build(BuildContext context) {
    const gap4 = SizedBox(height: 4);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.black26),
        child: Row(
          children: [
            Avatar(
              profilePath: actor.profilePath,
              dimension: 110,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Item(
                    option: 'NAME',
                    value: actor.name,
                  ),
                  gap4,
                  Item(
                    option: 'ORIGINAL NAME',
                    value: actor.originalName,
                  ),
                  gap4,
                  Item(
                    option: 'CHARACTER',
                    value: actor.character,
                  ),
                  gap4,
                  Item(
                    option: 'GENDER',
                    value: actor.gender.gender,
                  ),
                  gap4,
                  Item(
                    option: 'POPULARITY',
                    value: actor.popularity.toStringAsFixed(1),
                  ),
                  gap4,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.option,
    required this.value,
  });
  final String option;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$option: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}
