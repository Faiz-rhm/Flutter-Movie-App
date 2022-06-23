
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Movie.freezed.dart';
part 'Movie.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie({
    required bool adult,
    String? backdrop_path,
    String? genreIds,
    required int id,
    String? originalLanguage,
    String? originalTitle,
    required String overview,
    required double popularity,
    required String poster_path,
    DateTime? releaseDate,
    required String title,
    required bool video,
    double? vote_average,
    int? voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

