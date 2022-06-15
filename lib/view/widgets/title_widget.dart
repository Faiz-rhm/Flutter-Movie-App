import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/provider.dart';

class TitleWidget extends ConsumerWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieType = ref.watch(movieTypeProvider);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(movieType.name, style: theme.textTheme.headline5,)
    );
  }
}