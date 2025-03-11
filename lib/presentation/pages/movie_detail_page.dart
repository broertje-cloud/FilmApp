import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:film_app/domain/movie_model.dart';
import 'package:film_app/domain/movie_provider.dart';

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
              const SizedBox(height: 16),
              Text(movie.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text("Year: ${movie.year}", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text("Type: ${movie.type}", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text("IMDb ID: ${movie.imdbID}", style: const TextStyle(fontSize: 16, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
