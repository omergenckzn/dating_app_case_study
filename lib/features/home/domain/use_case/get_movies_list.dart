// lib/features/movie/domain/use_case/get_movies_list.dart
import 'package:dating_app/features/home/domain/entites/movies_list_response.dart';

import 'package:dating_app/features/home/domain/repository/movie_repository.dart';

class GetMoviesList {
  GetMoviesList(this._repo);
  final MovieRepository _repo;

  Future<MoviesListResponse> call(int page) {
    return _repo.getMoviesList(page);
  }
}
