// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      adult: json['adult'] as bool,
      backdrop_path: json['backdrop_path'] as String?,
      genreIds: json['genreIds'] as String?,
      id: json['id'] as int,
      originalLanguage: json['originalLanguage'] as String?,
      originalTitle: json['originalTitle'] as String?,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      poster_path: json['poster_path'] as String,
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      title: json['title'] as String,
      video: json['video'] as bool,
      vote_average: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['voteCount'] as int?,
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'genreIds': instance.genreIds,
      'id': instance.id,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.poster_path,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.vote_average,
      'voteCount': instance.voteCount,
    };
