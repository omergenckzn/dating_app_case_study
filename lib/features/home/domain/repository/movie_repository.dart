import 'package:dating_app/features/home/domain/entites/favorite_action.dart';
import 'package:dating_app/features/home/domain/entites/movie.dart';
import 'package:dating_app/features/home/domain/entites/movies_list_response.dart';

abstract class MovieRepository {
  Future<MoviesListResponse> getMoviesList(int page);
  Future<List<Movie>> getFavoriteMovies();
  Future<FavoriteAction> toggleFavorite(String movieId);

}
