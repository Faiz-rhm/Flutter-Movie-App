import 'package:flutter/material.dart';
import 'package:movie_app/env_config.dart';
import 'package:movie_app/model/MovieDetails/MovieDetails.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final MovieDetails movie;

  MySliverAppBar({required this.expandedHeight, required  this.movie});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none, fit: StackFit.expand,
      children: [
        Hero(
          tag: movie.id,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(
                  EnvironmentConfig.IMAGE_BASE_URL + movie.poster_path,
                )
              )
            ),
          ),
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