// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Casts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Casts _$$_CastsFromJson(Map<String, dynamic> json) => _$_Casts(
      adult: json['adult'] as bool,
      gender: json['gender'] as int,
      id: json['id'] as int,
      known_for_department: json['known_for_department'] as String,
      name: json['name'] as String,
      original_name: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profile_path: json['profile_path'] as String?,
      cast_id: json['cast_id'] as int,
      character: json['character'] as String,
      credit_id: json['credit_id'] as String,
      order: json['order'] as int,
    );

Map<String, dynamic> _$$_CastsToJson(_$_Casts instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.known_for_department,
      'name': instance.name,
      'original_name': instance.original_name,
      'popularity': instance.popularity,
      'profile_path': instance.profile_path,
      'cast_id': instance.cast_id,
      'character': instance.character,
      'credit_id': instance.credit_id,
      'order': instance.order,
    };
