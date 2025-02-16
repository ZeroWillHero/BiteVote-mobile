import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  final Key? searchKey;

  const CustomSearchBar({super.key, this.searchKey});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SearchBar(
        hintText: 'Search',
        leading: Icon(
          Icons.search,
          color: Colors.black38,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: Colors.black38,
              width: 2.0,
            ),
          ),
        ),
        elevation:
            WidgetStateProperty.all(0), // Set elevation to 0 to remove shadow
      ),
    );
  }
}
