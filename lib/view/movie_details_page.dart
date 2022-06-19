import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_app/model/MovieDetails/MovieDetails.dart';
import 'package:movie_app/provider.dart';
import 'package:movie_app/view/widgets/cast_list.dart';
import 'package:movie_app/view/widgets/recommended.dart';
import 'package:movie_app/view/widgets/sliver_app_bar.dart';
import 'package:rich_text_view/rich_text_view.dart';

class MovieDetailsPage extends StatelessWidget {

  const MovieDetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Consumer(
      builder: (BuildContext context, ref, child) {
        final movieDetails = ref.watch(movieDetailsProvider);
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
        color: Colors.grey.withOpacity(0.2),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.5, movie: movie
              ),
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
  }

  _buildMovieDetailsContent(BuildContext context, MovieDetails movie) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.adult ? "-18" : "18+", style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),),
              Row(
                children: [
                  const Icon(IconlyLight.star, size: 18, color: Colors.yellow,),
                  const SizedBox(width: 5,),
                  Text(movie.vote_average.toString(), style: theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox(width: 160,),
              InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                onTap: (){},
                child: const Icon(Icons.share)
              ),
              InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                onTap: (){},
                child: const Icon(Icons.bookmark_outline)
              ),
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
          const SizedBox(height: 10,),
          const CastList(),
          Text('Recommended', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16,),
          const RecommendedWidget()
        ],
      ),
    );
  }
}
