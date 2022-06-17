import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/model/MovieDetails/Genre.dart';
import 'package:movie_app/model/MovieDetails/ProductionCompany.dart';
import 'package:movie_app/model/MovieDetails/ProductionCountry.dart';
import 'package:movie_app/model/MovieDetails/SpokenLanguage.dart';

part 'MovieDetails.freezed.dart';
part 'MovieDetails.g.dart';

@freezed
class MovieDetails with _$MovieDetails {
  factory MovieDetails({
    required bool adult,
    required String backdrop_path,
    dynamic belongs_to_collection,
    required int budget,
    List<Genre>? genres,
    required String homepage,
    required int id,
    required String imdb_id,
    required String original_language,
    required String original_title,
    required String overview,
    required double popularity,
    required String poster_path,
    required List<ProductionCompany> production_companies,
    required List<ProductionCountry> production_countries,
    required String release_date,
    required int revenue,
    required int runtime,
    required List<SpokenLanguage> spoken_languages,
    required String status,
    required String tagline,
    required String title,
    required bool video,
    required double vote_average,
    required int vote_count
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);
}
