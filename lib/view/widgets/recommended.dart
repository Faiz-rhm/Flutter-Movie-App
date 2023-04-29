import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/env_config.dart';
import 'package:movie_app/model/Movie/Movie.dart';
import 'package:movie_app/provider.dart';
import 'package:skeletons/skeletons.dart';

class RecommendedWidget extends ConsumerWidget {
  const RecommendedWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final casts = ref.watch(upcomingProvider);
    return casts.maybeWhen(
      orElse: () => const Center(child: Text('Or Lese')),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (data) => _buildRecommendedList(context, data),
    );
  }

  _buildRecommendedList(BuildContext context, List<Movie> data) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final movie = data.elementAt(index);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.withOpacity(0.1),
                    image: DecorationImage(
                      image: NetworkImage('${EnvironmentConfig.IMAGE_BASE_URL}${movie.poster_path}',),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 100,
                  child: Text(
                    movie.title,
                    style: theme.textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _recommendedShimmer(){
     return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: double.infinity,
                      minHeight: MediaQuery.of(context).size.height / 8,
                      maxHeight: MediaQuery.of(context).size.height / 3,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 100,
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                      padding: const EdgeInsets.all(16.0),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}
