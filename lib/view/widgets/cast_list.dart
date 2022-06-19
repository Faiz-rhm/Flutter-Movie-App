import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/env_config.dart';
import 'package:movie_app/model/Cast/Cast.dart';
import 'package:movie_app/provider.dart';

class CastList extends ConsumerWidget {
  const CastList({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final casts = ref.watch(castProvider);
    print('casts: $casts');
    return casts.maybeWhen(
      orElse: () => const Center(child: Text('Or Lese')),
      loading: () => const Center(child: CircularProgressIndicator()),
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
}
