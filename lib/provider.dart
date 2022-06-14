import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/extension.dart';
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
  print('dio $dio');
  final response = await dio.get('movie/'+movieType.value,
    queryParameters: {
      'api_key': EnvironmentConfig.API_KEY
    }
  );
  return MovieResponse.fromJson(response.data).results!;

});

final movieProvider = Provider((ref) => throw UnimplementedError());
