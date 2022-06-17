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

    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //     children: [
    //       SizedBox(
    //         width: 100,
    //         child: Card(
    //           child: Column(
    //             children: [
    //               Image.network(
    //                 '${EnvironmentConfig.IMAGE_BASE_URL}${movie.poster_path}',
    //                 fit: BoxFit.cover,
    //               ),
    //               const Padding(
    //                 padding: EdgeInsets.all(5),
    //                 child: Text('Tom')
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  _buildCastList(BuildContext context, Cast data) {
    print('cast list');
    print(data);
    return SizedBox(
      height: 180,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: data.cast.length,
        itemBuilder: (context, index) {
          final cast = data.cast[index];
          return Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('${EnvironmentConfig.IMAGE_BASE_URL}${cast.profile_path}'),
                fit: BoxFit.cover,
              ),
            ),
            child:
            // add text at the bottom of image
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  cast.name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5,)
              ],
            ),
          );
        },
      ),
    );
  }
}
