import 'package:film_app/data/datasource/omdb_api.dart';
import 'package:film_app/domain/movie_model.dart';

/// Repository class to handle fetching and processing movie data.
class MovieRepository {
  final OmdbApi api;

  /// Constructor that takes an instance of OmdbApi.
  MovieRepository(this.api);

  /// Searches for movies based on a query and returns a list of MovieModel instances.
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await api.fetchMovies(query);

    if (response['Response'] == 'False') {
      throw Exception('No movies found or invalid API key');
    }

    if (response['Search'] != null) {
      return MovieModel.fromJsonList(response['Search']);
    } else {
      return [];
    }
  }

  /// Fetches detailed information about a specific movie using its IMDb ID.
  Future<MovieModel> getMovieDetails(String imdbID) async {
    final response = await api.fetchMovieDetails(imdbID);
    return MovieModel.fromJson(response);
  }
}
