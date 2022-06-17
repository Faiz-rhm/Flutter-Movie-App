
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Genre.freezed.dart';
part 'Genre.g.dart';

@freezed
class Genre with _$Genre {
  factory Genre({
    required int id,
    required String name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

