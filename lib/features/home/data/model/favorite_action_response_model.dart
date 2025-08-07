// lib/features/home/data/model/favorite_action_response_model.dart

import 'package:dating_app/features/home/data/model/movie_model.dart';

class FavoriteActionResponseModel {

  FavoriteActionResponseModel({
    required this.movie,
    required this.action,
  });

  factory FavoriteActionResponseModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return FavoriteActionResponseModel(
      movie: MovieModel.fromJson(json['movie'] as Map<String, dynamic>),
      action: json['action'] as String,
    );
  }
  final MovieModel movie;
  final String action;
}
