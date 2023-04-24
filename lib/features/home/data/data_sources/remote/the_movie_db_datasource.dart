import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_flutter_movie_db/core/core.dart';
import 'package:test_flutter_movie_db/features/features.dart';

abstract class ITheMovieDBDataSource {
  Future<Either<Exception, List<Character>>> getActors();
}

class TheMovieDBDataSource implements ITheMovieDBDataSource {
  @override
  Future<Either<Exception, List<Character>>> getActors() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.themoviedb.org/3/movie/11/credits?api_key=10e5f764a257048e63ff7f369acde821',
        ),
      );
      final body = response.body;
      final decode = json.decode(body) as Map<String, dynamic>;
      final actors = (decode['cast'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList();
      return Either.right(actors);
    } catch (_) {
      return Either.left(Exception(_.toString()));
    }
  }
}
