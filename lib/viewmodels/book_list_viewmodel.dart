import '../models/book.dart';
import '../models/book_data.dart';

class BookListViewModel {
  final List<Book> books = bookData;

  List<Book> search(String query) {
    final q = query.toLowerCase();
    return books.where((b) => b.title.toLowerCase().contains(q) || b.author.toLowerCase().contains(q)).toList();
  }
}
