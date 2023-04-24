import 'package:test_flutter_movie_db/core/core.dart';
import 'package:test_flutter_movie_db/features/features.dart';

abstract class IActorRepository {
  Future<Either<Exception, List<Character>>> getActor();
}
