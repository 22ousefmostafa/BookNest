import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/cover_image.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;
  const BookDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CoverImage(assetPath: book.coverAsset, width: 150, height: 220)),
            const SizedBox(height: 16),
            Text(book.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text('by ${book.author}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
            const SizedBox(height: 8),
            Wrap(children: [Chip(label: Text(book.category), backgroundColor: Colors.blue.shade50)]),
            const SizedBox(height: 12),
            Row(children: List.generate(5, (i) {final filled = i < book.rating.round(); return Icon(filled ? Icons.star : Icons.star_border, color: Colors.amber);})),
            const SizedBox(height: 16),
            const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(book.description, style: const TextStyle(fontSize: 14, height: 1.4)),
          ],
        ),
      ),
    );
  }
}
