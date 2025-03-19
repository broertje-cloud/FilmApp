import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const MoviePoster({
    Key? key,
    required this.imageUrl,
    this.width = 200,
    this.height = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8), 
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover, // Ensures the image resizes correctly
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50),
        ),
      ),
    );
  }
}

