import 'package:dating_app/core/config/api_routes.dart';
import 'package:dating_app/core/network/api_response.dart';
import 'package:dating_app/features/home/data/model/favorite_action_response_model.dart';
import 'package:dating_app/features/home/data/model/favorite_movies_response_model.dart';
import 'package:dating_app/features/home/data/model/get_movies_list_response_model.dart';
import 'package:dating_app/services/network_service.dart';

class MoviesDataSource {
  const MoviesDataSource({
    required this.manager,
  });
  final NetworkService manager;

  Future<ApiResponse<GetMoviesListResponseModel>> getMoviesList(
    int page,
  ) async {
    final resp = await manager.get<Map<String, dynamic>>(
      ApiRoutes.movieList,
      queryParameters: {'page': page},
    );
    if (resp.statusCode == 200 && resp.data != null) {
      return ApiResponse.fromJson(
        resp.data!,
        GetMoviesListResponseModel.fromJson,
      );
    }
    throw Exception('Failed to load movies (status: ${resp.statusCode})');
  }

  Future<FavoriteMoviesResponseModel> getFavoriteMovies() async {
    final resp = await manager.get<Map<String, dynamic>>(ApiRoutes.favorites);
    if (resp.statusCode == 200 && resp.data != null) {
      final rawList = resp.data!['data'] as List<dynamic>;
      return FavoriteMoviesResponseModel.fromJson(rawList);
    }
    throw Exception('Failed to load favorites (status: ${resp.statusCode})');
  }


  Future<ApiResponse<FavoriteActionResponseModel>> toggleFavorite(
    String movieId,
  ) async {
    final resp = await manager.post<Map<String, dynamic>>(
      '${ApiRoutes.favorite}/$movieId',
    );
    if (resp.statusCode == 200 && resp.data != null) {
      return ApiResponse.fromJson(
        resp.data!,
        FavoriteActionResponseModel.fromJson,
      );
    }
    throw Exception(
      'Failed to toggle favorite (status: ${resp.statusCode})',
    );
  }
}
