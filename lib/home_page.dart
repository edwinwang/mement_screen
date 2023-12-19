import 'package:flutter/material.dart';
import 'carousel_with_indicator.dart'; // Custom widget for carousel
import 'horizontal_list_view.dart'; // Custom widget for horizontal list view

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CarouselWithIndicator(), // Carousel widget
          const SizedBox(height: 20), // Spacing
          HorizontalListView(), // Horizontal list view
          // Add more widgets as needed
        ],
      ),
    );
  }
}
