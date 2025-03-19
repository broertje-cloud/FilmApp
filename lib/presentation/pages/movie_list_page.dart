import 'package:film_app/presentation/widgets/movie_card.dart';
import 'package:film_app/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:film_app/domain/movie_provider.dart';


/// Movie List Page where users can search for movies.
class MovieListPage extends ConsumerStatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends ConsumerState<MovieListPage> {


  @override
  Widget build(BuildContext context) {
    final movieState = ref.watch(movieSearchProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Search Movies")),
      body: Column(
        children: [
          // Search Bar
          const SearchBarWidget(),
          // Display Movies
          Expanded(
            child: movieState.when(
              loading: () {
                print(" Loading movies...");
                return const Center(child: CircularProgressIndicator());
              },
              error: (error, stackTrace) {
                print(" UI Error: $error");
                return Center(child: Text("Error: $error")); // Show error message on screen
              },
              data: (movies) {
                print(" UI Received ${movies.length} movies");
                if (movies.isEmpty) {
                  return const Center(child: Text("No movies found."));
                }
                return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(movie: movies[index]);
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
