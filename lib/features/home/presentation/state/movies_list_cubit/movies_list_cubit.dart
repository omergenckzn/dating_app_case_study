// lib/features/movie/presentation/cubit/movies_list_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:dating_app/features/home/domain/entites/movie.dart';
import 'package:dating_app/features/home/domain/use_case/get_movies_list.dart';

part 'movies_list_state.dart';

class MoviesListCubit extends Cubit<MoviesListState> {
  MoviesListCubit(
    this._getMoviesList,
  ) : super(MoviesListInitial());
  final GetMoviesList _getMoviesList;

  int _currentPage = 1;
  int _maxPage = 1;

  /// Fetches page 1 or next page
  Future<void> fetchMovies({bool isRefresh = false}) async {
    final currentState = state;
    // Prevent duplicate loads
    if (currentState is MoviesListLoadInProgress ||
        (currentState is MoviesListLoadSuccess &&
            currentState.hasReachedMax &&
            !isRefresh)) return;

    try {
      if (isRefresh) {
        _currentPage = 1;
        emit(MoviesListLoadInProgress());
      } else if (currentState is MoviesListLoadSuccess) {
        emit(currentState.copyWith(isLoadingMore: true));
      } else {
        emit(MoviesListLoadInProgress());
      }

      final response = await _getMoviesList(_currentPage);

      final movies = response.movies;
      _maxPage = response.pagination.maxPage;

      final allMovies = isRefresh
          ? movies
          : (currentState is MoviesListLoadSuccess
              ? [...currentState.movies, ...movies]
              : movies);

      final hasReachedMax = response.pagination.currentPage >= _maxPage;

      emit(
        MoviesListLoadSuccess(
          movies: allMovies,
          hasReachedMax: hasReachedMax,
          isLoadingMore: false,
        ),
      );

      _currentPage++;
    } catch (e) {
      emit(MoviesListLoadFailure(message: e.toString()));
    }
  }

  Future<void> refresh() => fetchMovies(isRefresh: true);

  Future<void> toggleFavorite(String movieId) async {
    final currentState = state;
    if (currentState is MoviesListLoadSuccess) {
      final original = currentState.movies;
      final updatedList = original.map((m) {
        if (m.id == movieId) {
          return Movie(
            id: m.id,
            title: m.title,
            year: m.year,
            rated: m.rated,
            released: m.released,
            runtime: m.runtime,
            genre: m.genre,
            director: m.director,
            writer: m.writer,
            actors: m.actors,
            plot: m.plot,
            language: m.language,
            country: m.country,
            awards: m.awards,
            poster: m.poster,
            metascore: m.metascore,
            imdbRating: m.imdbRating,
            imdbVotes: m.imdbVotes,
            imdbID: m.imdbID,
            type: m.type,
            response: m.response,
            images: m.images,
            comingSoon: m.comingSoon,
            isFavorite: !m.isFavorite,
          );
        }
        return m;
      }).toList();

      emit(currentState.copyWith(movies: updatedList));
      try {
        final toggled = original.firstWhere((m) => m.id == movieId).isFavorite;
        if (toggled) {
          //await _removeFavorite(movieId);
        } else {
          //await _addFavorite(movieId);
        }
      } catch (_) {}
    }
  }
}
