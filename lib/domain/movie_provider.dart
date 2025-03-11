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

  /// Constructor that initializes the repository and starts with an empty state.
  MovieSearchNotifier(this.repository) : super(const AsyncValue.loading());

  /// Searches for movies and updates the state
  Future<void> searchMovies(String query) async {
    state = const AsyncValue.loading(); // Show loading state
    try {
      final movies = await repository.searchMovies(query);
      state = AsyncValue.data(movies);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }
}

/// Provides the state notifier for searching movies
final movieSearchProvider =
StateNotifierProvider<MovieSearchNotifier, AsyncValue<List<MovieModel>>>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return MovieSearchNotifier(repository);
});
