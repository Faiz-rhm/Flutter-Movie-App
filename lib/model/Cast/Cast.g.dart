// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cast _$$_CastFromJson(Map<String, dynamic> json) => _$_Cast(
      id: json['id'] as int,
      cast: (json['cast'] as List<dynamic>)
          .map((e) => Casts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CastToJson(_$_Cast instance) => <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
    };
