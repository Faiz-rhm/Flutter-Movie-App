
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Casts.freezed.dart';
part 'Casts.g.dart';

@freezed
class Casts with _$Casts {
  factory Casts({
    required bool adult,
    required int gender,
    required int id,
    required String known_for_department,
    required String name,
    required String original_name,
    required double popularity,
    String? profile_path,
    required int cast_id,
    required String character,
    required String credit_id,
    required int order,
  }) = _Casts;

  factory Casts.fromJson(Map<String, dynamic> json) => _$CastsFromJson(json);
}

