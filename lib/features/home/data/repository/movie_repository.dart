// lib/features/movie/data/repositories/movie_repository_impl.dart
import 'package:dating_app/core/enums/status.dart';
import 'package:dating_app/features/home/data/data_source/movies_data_source.dart';
import 'package:dating_app/features/home/domain/entites/favorite_action.dart';
import 'package:dating_app/features/home/domain/entites/movie.dart';
import 'package:dating_app/features/home/domain/entites/movies_list_response.dart';
import 'package:dating_app/features/home/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._remote);
  final MoviesDataSource _remote;

  @override
  Future<MoviesListResponse> getMoviesList(int page) async {
    final model = await _remote.getMoviesList(page);
    if (model.status == Status.success && model.data != null) {
      return MoviesListResponse(
        movies: model.data!.movies,
        pagination: model.data!.pagination,
      );
    } else {
      throw Exception(model.message ?? 'Something failed');
    }
  }

  @override
  Future<List<Movie>> getFavoriteMovies() async {
    final model = await _remote.getFavoriteMovies();
    return model.movies;
  }

  @override
  Future<FavoriteAction> toggleFavorite(String movieId) async {
    final resp = await _remote.toggleFavorite(movieId);
    if (resp.data != null && resp.status == Status.success) {
      return FavoriteAction(movie: resp.data!.movie, action: resp.data!.action);
    } else {
      throw Exception(resp.message ?? 'Something failed');
    }
  }
}
