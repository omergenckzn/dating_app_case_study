import 'package:dating_app/features/home/domain/entites/movie.dart';
import 'package:dating_app/features/home/domain/repository/movie_repository.dart';

class GetFavoriteMovies {
  GetFavoriteMovies(this._repo);
  final MovieRepository _repo;

  Future<List<Movie>> call() {
    return _repo.getFavoriteMovies();
  }
}
