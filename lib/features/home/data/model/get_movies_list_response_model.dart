// lib/features/movie/data/models/get_movies_list_response_model.dart
import 'package:dating_app/features/home/data/model/movie_model.dart';
import 'package:dating_app/features/home/data/model/pagination_model.dart';

class GetMoviesListResponseModel {
  GetMoviesListResponseModel({
    required this.movies,
    required this.pagination,
  });

  factory GetMoviesListResponseModel.fromJson(Map<String, dynamic> json) {
    final moviesJson = json['movies'] as List<dynamic>;
    return GetMoviesListResponseModel(
      movies: moviesJson
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: PaginationModel.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );
  }
  final List<MovieModel> movies;
  final PaginationModel pagination;
}
