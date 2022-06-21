import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/extension.dart';
import 'package:movie_app/model/Cast/Cast.dart';
import 'package:movie_app/model/MovieDetails/MovieDetails.dart';
import 'package:movie_app/model/MovieResponse/MovieResponse.dart';

import 'env_config.dart';
import 'model/Movie/Movie.dart';

final dioProvider = Provider < Dio > ((ref) {
  return Dio(BaseOptions(
    baseUrl: EnvironmentConfig.BASE_URL,
  ));
});

final movieTypeProvider = StateProvider((ref)=>MoviesType.popular);

final moviesProvider = FutureProvider < List < Movie >> ((ref) async {
  final movieType = ref.watch(movieTypeProvider);
  final dio = ref.watch(dioProvider);
  final response = await dio.get('movie/'+movieType.value,
    queryParameters: {
      'api_key': EnvironmentConfig.API_KEY
    }
  );
  return MovieResponse.fromJson(response.data).results!;
});

final upcomingProvider = FutureProvider < List < Movie >> ((ref) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get('movie/upcoming',
    queryParameters: {
      'api_key': EnvironmentConfig.API_KEY
    }
  );
  return MovieResponse.fromJson(response.data).results!;
});

final movieIDProvider = StateProvider<int>((ref)=> 0);

final movieDetailsProvider = FutureProvider <MovieDetails>((ref) async {
  final movieID = ref.watch(movieIDProvider);
  final dio = ref.watch(dioProvider);
  final response = await dio.get('movie/'+movieID.toString(),
    queryParameters: {
      'api_key': EnvironmentConfig.API_KEY
    }
  );
  return MovieDetails.fromJson(response.data);
});

final castProvider = FutureProvider <Cast> ((ref) async {
  final movieID = ref.watch(movieIDProvider);
  final dio = ref.watch(dioProvider);
  final response = await dio.get('movie/'+movieID.toString()+'/credits',
    queryParameters: {
      'api_key': EnvironmentConfig.API_KEY
    }
  );
  return Cast.fromJson(response.data);
});

final movieProvider = Provider((ref) => throw UnimplementedError());
