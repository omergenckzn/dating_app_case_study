// lib/features/movie/domain/entities/movies_list_response.dart
import 'movie.dart';
import 'pagination.dart';

class MoviesListResponse {

  const MoviesListResponse({
    required this.movies,
    required this.pagination,
  });
  final List<Movie> movies;
  final Pagination pagination;
}
