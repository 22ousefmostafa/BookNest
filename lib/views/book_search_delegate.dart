import 'package:flutter/material.dart';
import '../models/book.dart';
// viewmodel import removed (not used)
import 'book_details_screen.dart';
import '../widgets/cover_image.dart';

class BookSearchDelegate extends SearchDelegate<Book?> {
  final List<Book> books;
  BookSearchDelegate(this.books);
  @override
  String get searchFieldLabel => 'Search books...';
  @override
  List<Widget>? buildActions(BuildContext context) => [if (query.isNotEmpty) IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')];
  @override
  Widget? buildLeading(BuildContext context) => IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => close(context, null));
  @override
  Widget buildResults(BuildContext context) {
    final results = books.where((b) => b.title.toLowerCase().contains(query.toLowerCase()) || b.author.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final book = results[index];
        return ListTile(
          leading: CoverImage(assetPath: book.coverAsset, width: 50, height: 80),
          title: Text(book.title),
          subtitle: Text('${book.author} • ${book.category}'),
          onTap: () {
            close(context, book);
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => BookDetailsScreen(book: book)));
          },
        );
      },
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ? books : books.where((b) => b.title.toLowerCase().contains(query.toLowerCase()) || b.author.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final book = suggestions[index];
        return ListTile(
          leading: CoverImage(assetPath: book.coverAsset, width: 50, height: 80),
          title: Text(book.title),
          subtitle: Text('${book.author} • ${book.category}'),
          onTap: () {
            query = book.title;
            showResults(context);
          },
        );
      },
    );
  }
}
