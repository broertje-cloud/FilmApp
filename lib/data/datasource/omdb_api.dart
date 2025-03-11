import 'dart:convert';
import 'package:http/http.dart' as http;

class OmdbApi {
  final String apiKey = 'http://www.omdbapi.com/?i=tt3896198&apikey=62e795df'; // Replace with your actual API key
  final String baseUrl = 'https://www.omdbapi.com/';

  /// Fetches a list of movies based on a search query.
  Future<Map<String, dynamic>> fetchMovies(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/?s=$query&apikey=62e795df'));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error fetching movies');
    }
  }

  /// Fetches detailed information about a specific movie using its IMDb ID.
  Future<Map<String, dynamic>> fetchMovieDetails(String imdbID) async {
    final response = await http.get(Uri.parse('$baseUrl/?i=$imdbID&apikey=62e795df'));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error fetching movie details');
    }
  }
}
