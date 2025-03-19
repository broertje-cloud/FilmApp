import 'package:film_app/presentation/widgets/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:film_app/domain/movie_model.dart';
import 'package:film_app/domain/movie_search_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// A reusable widget to display a movie card in the list.
class MovieCard extends ConsumerWidget {
  final MovieModel movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final movieController = MovieSearchController(ref);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: Image.network(
          movie.poster,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(movie.title, style: AppTextStyles.heading),
        subtitle: Text(movie.year, style: AppTextStyles.subtitle),
        onTap: () {
          movieController.goToMovieDetails(context, movie);
        },
      ),
    );
  }
}
