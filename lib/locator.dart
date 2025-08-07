import 'package:dating_app/features/home/data/data_source/movies_data_source.dart';
import 'package:dating_app/features/home/data/repository/movie_repository.dart';
import 'package:dating_app/features/home/domain/repository/movie_repository.dart';
import 'package:dating_app/features/home/domain/use_case/get_favorite_movies.dart';
import 'package:dating_app/features/home/domain/use_case/get_movies_list.dart';
import 'package:dating_app/features/home/domain/use_case/toggle_favorite_movie.dart';
import 'package:dating_app/features/user/data/data_source/user_data_source.dart';
import 'package:dating_app/features/user/data/repository/auth_repository.dart';
import 'package:dating_app/features/user/domain/repository/auth_reporitory.dart';
import 'package:dating_app/features/user/domain/use_case/get_profile_details.dart';
import 'package:dating_app/features/user/domain/use_case/sign_in_user.dart';
import 'package:dating_app/features/user/domain/use_case/sign_up_user.dart';
import 'package:dating_app/features/user/domain/use_case/upload_profile_photo.dart';
import 'package:dating_app/services/logger_service.dart';
import 'package:dating_app/services/network_service.dart';
import 'package:dating_app/services/token_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerLazySingleton<Dio>(Dio.new)
    //Services
    ..registerLazySingleton<TokenService>(TokenService.new)
    ..registerLazySingleton<NetworkService>(
      () => NetworkService(
        Dio(),
      ),
    )
    ..registerLazySingleton<LoggerService>(
      LoggerService.new,
    )
    // Data Sources
    ..registerLazySingleton<UserDataSource>(
      () => UserDataSource(manager: getIt<NetworkService>()),
    )
    ..registerLazySingleton<MoviesDataSource>(
      () => MoviesDataSource(manager: getIt<NetworkService>()),
    )
    //repositories
    ..registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getIt<MoviesDataSource>()),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<UserDataSource>()),
    )
    //usecases
    ..registerLazySingleton<GetProfileDetails>(
      () => GetProfileDetails(getIt<AuthRepository>()),
    )
    ..registerLazySingleton<GetMoviesList>(
      () => GetMoviesList(getIt<MovieRepository>()),
    )
    ..registerLazySingleton<GetFavoriteMovies>(
      () => GetFavoriteMovies(getIt<MovieRepository>()),
    )
    ..registerLazySingleton<ToggleFavoriteMovie>(
      () => ToggleFavoriteMovie(getIt<MovieRepository>()),
    )
    ..registerLazySingleton<SignUpUser>(
      () => SignUpUser(getIt<AuthRepository>()),
    )
    ..registerLazySingleton<UploadProfilePhoto>(
      () => UploadProfilePhoto(getIt<AuthRepository>()),
    )
    ..registerLazySingleton<SignInUser>(
      () => SignInUser(getIt<AuthRepository>()),
    );
}
