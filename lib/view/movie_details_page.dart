import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/env_config.dart';
import 'package:movie_app/model/Movie/Movie.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, ref, child) {
        return Scaffold(
          body: Container(
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Hero(
                      tag: movie,
                      child: Container(
                        height:  MediaQuery.of(context).size.height * 0.5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('${EnvironmentConfig.IMAGE_BASE_URL}${movie.poster_path}'),
                            fit: BoxFit.cover)
                          ),
                        ),
                    ),
                    Positioned(
                      top: 50,
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
                                color: Colors.grey.shade500,
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
                              color: Colors.grey.shade500,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                            ),
                            child: const Icon(
                              Icons.share,
                              size: 20,
                            ),
                          ),
                        ],
                      )
                    ),
                    Positioned(
                      left: 20,
                      bottom: -80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        '${EnvironmentConfig.IMAGE_BASE_URL}${movie.poster_path}'),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              Text(
                                movie.title,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${movie.releaseDate}"),
                                  const SizedBox(width: 50),
                                  const Icon(
                                    Icons.star,
                                    size: 18,
                                  ),
                                  Text("${movie.vote_average}/10"),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 100),
                const Divider(
                  thickness: 1.5,
                ),
                const SizedBox(height: 10),
                Text(movie.overview)
              ],
            ),
          ),
        );
      },
    );
  }
}
