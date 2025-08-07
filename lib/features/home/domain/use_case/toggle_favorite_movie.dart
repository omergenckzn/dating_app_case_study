import 'package:dating_app/features/home/domain/entites/favorite_action.dart';
import 'package:dating_app/features/home/domain/repository/movie_repository.dart';

class ToggleFavoriteMovie {
  ToggleFavoriteMovie(this._repo);
  final MovieRepository _repo;

  Future<FavoriteAction> call(String movieId) {
    return _repo.toggleFavorite(movieId);
  }
}
