import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:film_app/domain/movie_provider.dart';
import 'package:film_app/presentation/widgets/ui_helpers.dart';


/// Movie Details Page that shows information about a selected movie.
class MovieDetailPage extends ConsumerWidget {
  final String imdbID;

  const MovieDetailPage({Key? key, required this.imdbID}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieState = ref.watch(movieDetailsProvider(imdbID));

    return Scaffold(
      appBar: AppBar(title: const Text("Movie Details")),
      body: movieState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text("Error: $error")),
        data: (movie) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  movie.poster,
                  width: 200,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              UIHelper.verticalSpaceMedium,

              Text(movie.title, style: AppTextStyles.heading),
              UIHelper.verticalSpaceSmall,

              Text("Year: ${movie.year}", style: AppTextStyles.subtitle),
              UIHelper.verticalSpaceSmall,

              Text("Type: ${movie.type}", style: AppTextStyles.body),
              UIHelper.verticalSpaceSmall,

              Text("IMDb ID: ${movie.imdbID}", style: AppTextStyles.caption),
            ],
          ),
        ),
      ),
    );
  }
}
