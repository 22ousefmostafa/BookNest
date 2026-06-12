import 'package:flutter/material.dart';
import '../viewmodels/book_list_viewmodel.dart';
import '../widgets/cover_image.dart';
import '../models/book.dart';
import 'book_details_screen.dart';
import 'book_search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = BookListViewModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookNest'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(context: context, delegate: BookSearchDelegate(vm.books)),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: vm.books.length,
        itemBuilder: (context, index) {
          final Book book = vm.books[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => BookDetailsScreen(book: book))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipRRect(borderRadius: BorderRadius.circular(6), child: CoverImage(assetPath: book.coverAsset, width: 72, height: 110)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(book.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text(book.author, style: const TextStyle(color: Colors.black54)),
                        const SizedBox(height: 6),
                        Wrap(children: [Chip(label: Text(book.category), backgroundColor: Colors.blue.shade50)]),
                        const SizedBox(height: 8),
                        Text(book.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, color: Colors.black87)),
                        const SizedBox(height: 8),
                        Row(mainAxisAlignment: MainAxisAlignment.end, children: [const Icon(Icons.star, color: Colors.amber, size: 18), const SizedBox(width: 4), Text(book.rating.toString())])
                      ]),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
