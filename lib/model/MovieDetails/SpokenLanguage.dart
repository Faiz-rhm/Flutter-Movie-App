
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SpokenLanguage.freezed.dart';
part 'SpokenLanguage.g.dart';

@freezed
class SpokenLanguage with _$SpokenLanguage {
  factory SpokenLanguage({
    required String english_name,
    required String iso_639_1,
    required String name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => _$SpokenLanguageFromJson(json);
}

