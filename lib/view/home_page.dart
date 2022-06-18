
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_app/env_config.dart';
import 'package:movie_app/provider.dart';
import 'package:movie_app/view/movie_details_page.dart';
import 'package:movie_app/view/widgets/movie_tag_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme =  Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(IconlyLight.category),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.notification),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(IconlyLight.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0,  vertical:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // add search textfield and filter button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        // height: 45,
                        child: TextField(
                          decoration:  InputDecoration(
                            hintText: 'Search movies, series...',
                            filled: true,
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          isDense: true,
                          prefixIcon: const Icon(IconlyLight.search),
                        ),
                        style: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400, color: Colors.grey.shade400),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.shade900,
                      ),
                      child: IconButton(
                        icon: const Icon(IconlyLight.filter),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Consumer(
                builder: ((context, ref, child) {
                  final moviesAsyncValue = ref.watch(upcomingProvider);
                  return moviesAsyncValue.maybeWhen(
                    orElse: () => const Center(child: CircularProgressIndicator()),
                    data: (movies) => SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return Container(
                          width: MediaQuery.of(context).size.height * 0.47,
                          margin: const EdgeInsets.only(right: 25),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                            image: DecorationImage(
                              image: NetworkImage(EnvironmentConfig.IMAGE_BASE_URL_COVER + movie.backdrop_path),
                              fit: BoxFit.fill
                            )
                          ),
                          child: Container(
                            // padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              // color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(movie.title, style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Icon(IconlyLight.star, size: 18, color: Colors.yellow,),
                                        const SizedBox(width: 2,),
                                        Text(movie.vote_average.toString(), style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    // color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.star, size: 18, color: Colors.yellow,),
                                      const SizedBox(width: 2,),
                                      Text(movie.vote_average.toString(), style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    ))
                  );
                })
              ),
              const MovieTags(),
              const SizedBox(height: 16,),
              const MovieList()
            ],
          ),
        ),
      ),
    );
  }
}

class MovieList extends ConsumerWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final moviesAsyncValue = ref.watch(moviesProvider);
    return moviesAsyncValue.maybeWhen(
      orElse: () => const Center(child: CircularProgressIndicator()),
      data: (movies) =>
      SizedBox(
        height: 350,
        child: Swiper(
          itemCount: movies.length,
          viewportFraction: 0.42,
          scale: 0.5,
          itemBuilder: (BuildContext context, int index) {
            final movie = movies[index];
            return InkWell(
              onTap: () {
                ref.read(movieIDProvider.notifier).state = movie.id;
                Navigator.push(context,MaterialPageRoute(builder: (context) => const MovieDetailsPage()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Hero(
                      tag: movie.id,
                      child: Container(
                        height: 260,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          image: DecorationImage(
                            // fit: BoxFit.fill,s
                            image: NetworkImage(
                              EnvironmentConfig.IMAGE_BASE_URL + movie.poster_path,
                            )
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: Text(movie.adult ? "-18" : "18+", style: theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),)
                          ),
                          // const SizedBox(width: 5,),
                          Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              color:Colors.grey.withOpacity(0.1),
                            ),
                            child: Text('Action', style: theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),)
                          ),
                          // const SizedBox(width: 5,),
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
                                Text(movie.vote_average.toString(), style: theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),),
                              ],
                            )
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Text(movie.title, style : theme.textTheme.headline6!.copyWith(color: Colors.grey.shade500), overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            );
          },
        ),
      )
    );
  }
}
