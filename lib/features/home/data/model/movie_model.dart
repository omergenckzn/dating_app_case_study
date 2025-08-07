// lib/features/movie/data/models/movie_model.dart
import 'package:dating_app/features/home/domain/entites/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.year,
    required super.rated,
    required super.released,
    required super.runtime,
    required super.genre,
    required super.director,
    required super.writer,
    required super.actors,
    required super.plot,
    required super.language,
    required super.country,
    required super.awards,
    required super.poster,
    required super.metascore,
    required super.imdbRating,
    required super.imdbVotes,
    required super.imdbID,
    required super.type,
    required super.response,
    required super.images,
    required super.comingSoon,
    required super.isFavorite,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as String,
      title: json['Title'] as String,
      year: json['Year'] as String,
      rated: json['Rated'] as String,
      released: json['Released'] as String,
      runtime: json['Runtime'] as String,
      genre: json['Genre'] as String,
      director: json['Director'] as String,
      writer: json['Writer'] as String,
      actors: json['Actors'] as String,
      plot: json['Plot'] as String,
      language: json['Language'] as String,
      country: json['Country'] as String,
      awards: json['Awards'] as String,
      poster: json['Poster'] as String,
      metascore: json['Metascore'] as String,
      imdbRating: json['imdbRating'] as String,
      imdbVotes: json['imdbVotes'] as String,
      imdbID: json['imdbID'] as String,
      type: json['Type'] as String,
      response: json['Response'] as String,
      images: (json['Images'] as List<dynamic>).cast<String>(),
      comingSoon: json['ComingSoon'] as bool,
      isFavorite: json['isFavorite'] as bool,
    );
  }
}
