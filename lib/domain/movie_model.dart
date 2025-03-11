import 'dart:convert';

/// Model class representing a movie fetched from the OMDb API.
class MovieModel {
  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  /// Constructor for MovieModel.
  MovieModel({
    required this.title,
    required this.year,
    required this.imdbID,
    required this.type,
    required this.poster,
  });

  /// Factory constructor to create a MovieModel from a JSON object.
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['Title'] ?? 'No Title',
      year: json['Year'] ?? 'Unknown Year',
      imdbID: json['imdbID'] ?? '',
      type: json['Type'] ?? 'Unknown Type',
      poster: json['Poster'] ?? 'https://via.placeholder.com/150', // Default image if no poster found
    );
  }

  /// Converts a list of JSON objects into a list of MovieModel instances.
  static List<MovieModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MovieModel.fromJson(json)).toList();
  }

  /// Converts MovieModel into a JSON format (for potential future use).
  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Year': year,
      'imdbID': imdbID,
      'Type': type,
      'Poster': poster,
    };
  }
}
