import 'package:bitevote/components/custom_search_bar.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          SizedBox(height: 150),
          // Search bar
          Expanded(child: CustomSearchBar()),
          SizedBox(width: 16.0),
          // Cart icon
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart icon press
            },
          ),
        ],
      ),
    );
  }
}
