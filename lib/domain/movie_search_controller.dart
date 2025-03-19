import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:film_app/domain/movie_provider.dart';
import 'package:film_app/presentation/pages/movie_detail_page.dart';
import 'package:film_app/domain/movie_model.dart';

class MovieSearchController {
  final WidgetRef ref;

  MovieSearchController(this.ref);

  void searchMovies(String query) {
    if (query.isNotEmpty) {
      ref.read(movieSearchProvider.notifier).searchMovies(query);
    }
  }

  void goToMovieDetails(BuildContext context, MovieModel movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(imdbID: movie.imdbID),
      ),
    );
  }
}
