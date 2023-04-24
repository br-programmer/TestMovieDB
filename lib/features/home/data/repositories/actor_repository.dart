import 'package:test_flutter_movie_db/core/helpers/either.dart';
import 'package:test_flutter_movie_db/features/features.dart';

class ActorRepository implements IActorRepository {
  ActorRepository(this._dataSource);
  final ITheMovieDBDataSource _dataSource;

  @override
  Future<Either<Exception, List<Character>>> getActor() async {
    final result = await _dataSource.getActors();
    return result.when(left: Either.left, right: Either.right);
  }
}
