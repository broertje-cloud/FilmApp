import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:film_app/data/repositories/movie_repository.dart';
import 'package:film_app/domain/movie_model.dart';
import 'package:film_app/data/datasource/omdb_api.dart';

/// Provides an instance of the MovieRepository
final movieRepositoryProvider = Provider((ref) {
  return MovieRepository(OmdbApi());
});

/// StateNotifier to manage movie search results
class MovieSearchNotifier extends StateNotifier<AsyncValue<List<MovieModel>>> {
  final MovieRepository repository;

  MovieSearchNotifier(this.repository) : super(const AsyncValue.data([])); // Default state is an empty list

  Future<void> searchMovies(String query) async {
    state = const AsyncValue.loading(); // Show loading state
    try {
      final List<MovieModel> movies = await repository.searchMovies(query);
      state = AsyncValue.data(movies);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}


/// Provides the state notifier for searching movies
final StateNotifierProvider<MovieSearchNotifier, AsyncValue<List<MovieModel>>> movieSearchProvider =
StateNotifierProvider<MovieSearchNotifier, AsyncValue<List<MovieModel>>>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return MovieSearchNotifier(repository);
});



/// Provider to fetch movie details based on IMDb ID
 final movieDetailsProvider = FutureProvider.family<MovieModel, String>((ref, imdbID) async {
   final repository = ref.watch(movieRepositoryProvider);
   return await repository.getMovieDetails(imdbID);
 });

// final FutureProvider movieDetailsProvider = FutureProvider.family<MovieModel, String>((ref, imdbID) async =>
//   await ref.watch(movieRepositoryProvider).getMovieDetails(imdbID)) as FutureProvider;
