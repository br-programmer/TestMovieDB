import 'package:flutter/material.dart';
import 'package:test_flutter_movie_db/core/core.dart';
import 'package:test_flutter_movie_db/features/features.dart';

class ActorItem extends StatelessWidget {
  const ActorItem({super.key, required this.actor});
  final Character actor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => DetailsScreen(actor: actor)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xFF030754),
          ),
          child: Row(
            children: [
              Avatar(profilePath: actor.profilePath),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      actor.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(actor.character),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
