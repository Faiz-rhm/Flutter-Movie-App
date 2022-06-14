
import 'package:movie_app/model/Movie/Movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'MovieResponse.freezed.dart';
part 'MovieResponse.g.dart';

@freezed
class MovieResponse with _$MovieResponse {
 factory  MovieResponse({
    int? page,
    List<Movie>? results,
    int? totalPages,
    int? totalResults,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);
}