import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/env_config.dart';
import 'package:movie_app/model/MovieDetails/MovieDetails.dart';
import 'package:movie_app/provider.dart';
import 'package:rich_text_view/rich_text_view.dart';

class MovieDetailsPage extends StatelessWidget {

  const MovieDetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Consumer(
      builder: (BuildContext context, ref, child) {
        final movieDetails = ref.watch(movieDetailsProvider);
        print('movieDetails: $movieDetails');
        return movieDetails.maybeWhen(
          orElse: () => const Center(child: Text('Or Lese')),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (data) => _buildMovieDetails(context, data),
        );
      },
    );
  }

  _buildMovieDetails(BuildContext context, MovieDetails movie) {
    return SafeArea(
      child: Material(
        color: Colors.black,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: MediaQuery.of(context).size.height * 0.5, movie: movie),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _buildMovieDetailsContent(context, movie);
                },
                childCount: 1,
              ),
            )
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Stack(
    //         clipBehavior: Clip.none,
    //         children: [
    //           Hero(
    //             tag: movie,
    //             child: Container(
    //               height:  MediaQuery.of(context).size.height * 0.5,
    //               width: double.infinity,
    //               decoration: BoxDecoration(
    //                 image: DecorationImage(
    //                   image: NetworkImage('${EnvironmentConfig.IMAGE_BASE_URL}${movie.poster_path}'),
    //                   fit: BoxFit.cover)
    //                 ),
    //               ),
    //           ),
    //           Positioned(
    //             top: 40,
    //             left: 16,
    //             right: 20,
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 GestureDetector(
    //                   onTap: () =>  Navigator.pop(context),
    //                   child: Container(
    //                     padding: const EdgeInsets.all(12),
    //                     decoration: BoxDecoration(
    //                       color: Colors.grey.withOpacity(0.5),
    //                       borderRadius: const BorderRadius.all(Radius.circular(10))
    //                     ),
    //                     child: const Icon(
    //                       Icons.arrow_back,
    //                       size: 20,
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   padding: const EdgeInsets.all(12),
    //                   decoration: BoxDecoration(
    //                     color: Colors.grey.withOpacity(0.5),
    //                     borderRadius: const BorderRadius.all(Radius.circular(10))
    //                   ),
    //                   child: const Icon(
    //                     Icons.share,
    //                     size: 20,
    //                   ),
    //                 ),
    //               ],
    //             )
    //           ),
    //           Positioned(
    //             left: 20,
    //             bottom: -80,
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //               children: [
    //                 Container(
    //                   height: 120,
    //                   width: 100,
    //                   decoration: BoxDecoration(
    //                       image: DecorationImage(
    //                           image: NetworkImage(
    //                               '${EnvironmentConfig.IMAGE_BASE_URL}${movie.poster_path}'),
    //                           fit: BoxFit.cover)),
    //                 ),
    //                 const SizedBox(width: 20),
    //                 Column(
    //                   children: [
    //                     Text(
    //                       movie.title,
    //                       style: Theme.of(context).textTheme.headline6,
    //                     ),
    //                     const SizedBox(height: 20),
    //                     Row(
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //                         Text(movie.release_date),
    //                         const SizedBox(width: 50),
    //                         const Icon(
    //                           Icons.star,
    //                           size: 18,
    //                         ),
    //                         const Text("{movie.vote_average'}/10"),
    //                       ],
    //                     )
    //                   ],
    //                 )
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //       const SizedBox(height: 100),
    //       const Divider(
    //         thickness: 1.5,
    //       ),
    //       Text(movie.title, style: theme.textTheme.titleLarge),
    //       const SizedBox(height: 16,),
    //        RichTextView(
    //         text:movie.overview,
    //         maxLines: 4,
    //         style: theme.textTheme.bodyText1!.copyWith(height: 1.5, color: Colors.grey.shade200),
    //         truncate: true,
    //         viewLessText: 'less',
    //         linkStyle: theme.textTheme.bodyText1!.copyWith(color: Colors.red.shade900),
    //         supportedTypes: const [
    //           ParsedType.EMAIL,
    //           ParsedType.HASH,
    //           ParsedType.MENTION,
    //           ParsedType.URL,
    //           ParsedType.BOLD
    //         ],
    //       ),

    //       const SizedBox(height: 10),

    //     ],
    //   ),
    // );
  }

  _buildMovieDetailsContent(BuildContext context, MovieDetails movie) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Text(movie.adult ? "-18" : "18+", style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),)
              ),
              // const SizedBox(width: 10,),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color:Colors.grey.withOpacity(0.1),
                ),
                child: Text('Action', style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),)
              ),
              // const SizedBox(width: 10,),
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, size: 18, color: Colors.yellow,),
                    const SizedBox(width: 5,),
                    Text(movie.vote_average.toString(), style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),),
                  ],
                )
              ),
              // const SizedBox(width: 50,),
              // Icon(Icons.add_circle_outline, size: 25, color: Colors.grey.shade400,),
              // Icon(Icons.send_outlined, size: 18, color: Colors.grey.shade400,),
            ],
          ),
          const SizedBox(height: 16,),
          Text(movie.tagline, style: Theme.of(context).textTheme.overline!.copyWith(color: Colors.grey.shade400, fontSize: 12),),
          const SizedBox(height: 16,),
          Text('Overview', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12,),
          RichTextView(
            text: movie.overview,
            maxLines: 4,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.5, color: Colors.grey.shade200),
            truncate: true,
            viewLessText: 'less',
            linkStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.red.shade900),
            supportedTypes: const [
              ParsedType.EMAIL,
              ParsedType.HASH,
              ParsedType.MENTION,
              ParsedType.URL,
              ParsedType.BOLD
            ],
          ),
          const SizedBox(height: 16),
          Text('Top Bill Cost', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          '${EnvironmentConfig.IMAGE_BASE_URL}${movie.poster_path}',
                          fit: BoxFit.cover,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text('Tom')
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100,)
        ],
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final MovieDetails movie;

  MySliverAppBar({required this.expandedHeight, required  this.movie});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none, fit: StackFit.expand,
      children: [
        Image.network(
          '${EnvironmentConfig.IMAGE_BASE_URL}${movie.poster_path}',
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 10,
          left: 16,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () =>  Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child: const Icon(
                  Icons.favorite_outline,
                  size: 20,
                ),
              ),
            ],
          )
        ),
        Positioned(
          top: expandedHeight / 1.3 - shrinkOffset,
          left: 0,
          right: 0,
          child: Column(
            children:[
              Opacity(
                opacity: (1 - shrinkOffset / expandedHeight),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(movie.original_title, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white,),textAlign: TextAlign.center,),
                ),
              ),
              Opacity(
                opacity: (1 - shrinkOffset / expandedHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(movie.release_date.substring(0,4), style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,),textAlign: TextAlign.center,),
                    const SizedBox(width: 10,),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(width: 10,),
                    movie.genres !=  null ? Text('${movie.genres![0].name},', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,),textAlign: TextAlign.center,) : Container(),
                    const SizedBox(width: 5,),
                    movie.genres !=  null ? Text(movie.genres![2].name, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,),textAlign: TextAlign.center,) : Container(),
                    const SizedBox(width: 10,),
                    Container(
                      height: 5,
                      width: 5,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text('${movie.runtime.toString().substring(0, 1)}h ${movie.runtime.toString().substring(1)}m', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,),textAlign: TextAlign.center,),
                  ],
                ),
              )
            ]
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}