import '../models/book.dart';

class BookDetailsViewModel {
  late Book book;
  bool isFavorite = false;

  BookDetailsViewModel(this.book);

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
