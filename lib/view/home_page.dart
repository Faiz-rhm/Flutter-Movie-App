import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/env_config.dart';
import 'package:movie_app/provider.dart';
import 'package:movie_app/view/widgets/movie_tag_widget.dart';
import 'package:movie_app/view/widgets/title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TitleWidget(),
      ),
      body: Column(
        children: const [
          MovieTags(),
          Expanded(child: MovieList()),
        ],
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
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            itemCount: movies.length,
            itemBuilder : (BuildContext context, int index) {
              final movie = movies[index];
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  EnvironmentConfig.IMAGE_BASE_URL + movie.poster_path,
                                )
                              )
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(child: Text(movie.title, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 15), overflow: TextOverflow.ellipsis)),
                      ]
                    ),
                  ),
                ),
              );
            },
            gridDelegate : const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
        ),
      )
    );
  }
}
