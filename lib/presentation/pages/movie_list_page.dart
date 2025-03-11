import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:film_app/domain/movie_provider.dart';
import 'package:film_app/domain/movie_model.dart';

/// Movie List Page where users can search for movies.
class MovieListPage extends ConsumerStatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends ConsumerState<MovieListPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final movieState = ref.watch(movieSearchProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Search Movies")),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search for a movie",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final query = _searchController.text;
                    if (query.isNotEmpty) {
                      ref.read(movieSearchProvider.notifier).searchMovies(query);
                    }
                  },
                ),
              ),
            ),
          ),

          // Display Movies
          Expanded(
            child: movieState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(child: Text("Error: $error")),
              data: (movies) {
                if (movies.isEmpty) {
                  return const Center(child: Text("No movies found."));
                }
                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return ListTile(
                      leading: Image.network(
                        movie.poster,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(movie.title),
                      subtitle: Text(movie.year),
                      onTap: () {
                        // TODO: Navigate to Movie Details Page
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
