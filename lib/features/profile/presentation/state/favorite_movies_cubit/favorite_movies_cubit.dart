// lib/features/movie/presentation/cubit/favorite_movies_cubit.dart
import 'package:dating_app/features/home/domain/entites/movie.dart';
import 'package:dating_app/features/home/domain/use_case/get_favorite_movies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_movies_state.dart';

class FavoriteMoviesCubit extends Cubit<FavoriteMoviesState> {
  FavoriteMoviesCubit(this._getFavoriteMovies) : super(FavoriteMoviesInitial());
  final GetFavoriteMovies _getFavoriteMovies;

  /// Load the user's favorite movies
  Future<void> fetchFavorites() async {
    emit(FavoriteMoviesLoading());
    try {
      final movies = await _getFavoriteMovies();
      emit(FavoriteMoviesLoaded(movies: movies));
    } catch (e) {
      emit(FavoriteMoviesFailure(message: e.toString()));
    }
  }
}
