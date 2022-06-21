import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/env_config.dart';
import 'package:movie_app/model/Cast/Cast.dart';
import 'package:movie_app/provider.dart';
import 'package:skeletons/skeletons.dart';

class CastList extends ConsumerWidget {
  const CastList({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final casts = ref.watch(castProvider);

    return casts.maybeWhen(
      orElse: () => const Center(child: Text('Or Lese')),
      loading: () => _castListShimmer(),
      data: (data) => _buildCastList(context, data),
    );
  }

  _buildCastList(BuildContext context, Cast data) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: data.cast.length,
        itemBuilder: (context, index) {
          final cast = data.cast[index];
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.43,
            // height: 70,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.1),
                radius: 30,
                backgroundImage: NetworkImage('${EnvironmentConfig.IMAGE_BASE_URL}${cast.profile_path}'),
              ),
              title: Text(cast.known_for_department, style: theme.textTheme.overline),
              subtitle: Text(cast.character, style: theme.textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),
              contentPadding: const EdgeInsets.all(0),
              horizontalTitleGap: 5,
            ),
          );
        },
      ),
    );
  }

  _castListShimmer(){
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.43,
            child: SkeletonListTile(
              hasSubtitle: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              leadingStyle: const SkeletonAvatarStyle(shape: BoxShape.circle, width: 50, height: 50),
              titleStyle: SkeletonLineStyle(borderRadius: BorderRadius.circular(16)),
              subtitleStyle: SkeletonLineStyle(
                borderRadius: BorderRadius.circular(16),
                randomLength: true,
                maxLength: 128,
                height: 12
              ),
              verticalSpacing: 10,
            ),
          );
        },
      ),
    );

  }
}
