// lib/features/movie/presentation/cubit/movies_list_state.dart

part of 'movies_list_cubit.dart';

abstract class MoviesListState {}

class MoviesListInitial extends MoviesListState {}

class MoviesListLoadInProgress extends MoviesListState {}

class MoviesListLoadSuccess extends MoviesListState {
  MoviesListLoadSuccess({
    required this.movies,
    required this.hasReachedMax,
    required this.isLoadingMore,
  });
  final List<Movie> movies;
  final bool hasReachedMax;
  final bool isLoadingMore;

  MoviesListLoadSuccess copyWith({
    List<Movie>? movies,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return MoviesListLoadSuccess(
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class MoviesListLoadFailure extends MoviesListState {
  MoviesListLoadFailure({required this.message});
  final String message;
}
