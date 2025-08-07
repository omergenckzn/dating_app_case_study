// lib/features/movie/data/models/favorite_movies_response_model.dart

import 'package:dating_app/features/home/data/model/movie_model.dart';

class FavoriteMoviesResponseModel {
  FavoriteMoviesResponseModel({required this.movies});

  factory FavoriteMoviesResponseModel.fromJson(List<dynamic> json) {
    return FavoriteMoviesResponseModel(
      movies:
          json.cast<Map<String, dynamic>>().map(MovieModel.fromJson).toList(),
    );
  }
  final List<MovieModel> movies;
}
