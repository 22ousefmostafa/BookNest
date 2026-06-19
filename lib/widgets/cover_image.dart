import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  final String assetPath;
  final double width;
  final double height;

  const CoverImage({
    super.key,
    required this.assetPath,
    this.width = 80,
    this.height = 120,
  });

  @override
  Widget build(BuildContext context) {
    final normalizedPath =
        assetPath.startsWith('assets/') ? assetPath : 'assets/$assetPath';

    return Image.asset(
      normalizedPath,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.blueGrey,
          child: const Icon(Icons.book, color: Colors.white),
        );
      },
    );
  }
}

