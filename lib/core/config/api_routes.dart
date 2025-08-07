import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;

class ApiRoutes {
  static String get baseUrlDev => dotenv.env['API_BASE_URL_DEV'] ?? '';
  static String get baseUrlProduction =>
      dotenv.env['API_BASE_URL_PRODUCTION'] ?? '';
  static String get baseUrlStaging => dotenv.env['API_BASE_URL_STAGING'] ?? '';

  static String login = '/user/login';
  static String profile = '/user/profile';
  static const register = '/user/register';
  static const uploadPhoto = '/user/upload_photo';
  static const movieList = '/movie/list';
  static const favorites = '/movie/favorites';
  static const favorite = '/movie/favorite';
}
