// lib/features/movie/presentation/cubit/favorite_movies_state.dart
part of 'favorite_movies_cubit.dart';

abstract class FavoriteMoviesState {}

class FavoriteMoviesInitial extends FavoriteMoviesState {}

class FavoriteMoviesLoading extends FavoriteMoviesState {}

class FavoriteMoviesLoaded extends FavoriteMoviesState {
  FavoriteMoviesLoaded({required this.movies});
  final List<Movie> movies;
}

class FavoriteMoviesFailure extends FavoriteMoviesState {
  FavoriteMoviesFailure({required this.message});
  final String message;
}
