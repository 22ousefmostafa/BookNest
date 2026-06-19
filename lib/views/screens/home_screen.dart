import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../viewmodels/book_list_viewmodel.dart';
import '../../widgets/book_card.dart';
import 'book_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _viewModel = BookListViewModel();
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All',
      ..._viewModel.books.map((b) => b.category).toSet()
    ];
    final filteredBooks = _selectedCategory == 'All'
        ? _viewModel.books
        : _viewModel.books
            .where((b) => b.category == _selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '📚 BookNest',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: BookSearchDelegate(_viewModel.books),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Category Filter
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == _selectedCategory;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() => _selectedCategory = category);
                    },
                    backgroundColor: Colors.white,
                    selectedColor: AppTheme.primaryColor,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
          ),
          // Books Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.65,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
              ),
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                return BookCard(book: filteredBooks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
