import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_app/env_config.dart';
import 'package:movie_app/model/Movie/Movie.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Movie movie;

  MySliverAppBar({required this.expandedHeight, required  this.movie});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent,) {
    return Stack(
      clipBehavior: Clip.none, fit: StackFit.expand,
      children: [
        Hero(
          tag: movie.id,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(EnvironmentConfig.IMAGE_BASE_URL + movie.poster_path,)
              )
            ),
          ),
        ),
        Positioned(
          top: 40,
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
                    IconlyLight.arrow_left,
                    size: 20,
                    color: Colors.black,
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
                  IconlyLight.heart,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black.withOpacity(0.5),
              child: Column(
                children:[
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Text(movie.title, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white,),textAlign: TextAlign.center,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text('2022', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,),textAlign: TextAlign.center,),
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
                      Text('Action', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,),textAlign: TextAlign.center,),
                      const SizedBox(width: 5,),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text('1h 44m', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,),textAlign: TextAlign.center,),
                    ],
                  ),
                ]
              ),
            ),
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