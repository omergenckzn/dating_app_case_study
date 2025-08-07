// lib/features/home/domain/entities/favorite_action.dart

import 'package:dating_app/features/home/domain/entites/movie.dart';

class FavoriteAction {
  FavoriteAction({
    required this.movie,
    required this.action,
  });
  final Movie movie;
  final String action;
}
