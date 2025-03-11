import 'package:flutter/material.dart';
import 'package:film_app/data/datasource/omdb_api.dart';
import 'package:film_app/data/repositories/movie_repository.dart';
import 'package:film_app/domain/movie_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  OmdbApi api = OmdbApi();
  MovieRepository repo = MovieRepository(api);

  // Test: Search for movies using the new MovieModel
  try {
    List<MovieModel> movies = await repo.searchMovies("Batman");
    print("Movies found: ${movies.length}");
    for (var movie in movies) {
      print("Title: ${movie.title}, Year: ${movie.year}");
    }
  } catch (e) {
    print("Error: $e");
  }

  // Test: Fetch movie details
  try {
    MovieModel details = await repo.getMovieDetails("tt0372784"); // Batman Begins
    print("Movie Details - Title: ${details.title}, Year: ${details.year}");
  } catch (e) {
    print("Error: $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("OMDb Model Test")),
        body: Center(child: Text("Check the console for API results!")),
      ),
    );
  }
}
