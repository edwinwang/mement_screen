import 'package:flutter/material.dart';
import '../widgets/carousel_with_indicator.dart'; // Custom widget for carousel
import '../widgets/horizontal_list_view.dart'; // Custom widget for horizontal list view
import '../config/api_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CarouselWithIndicator(), // Carousel widget
          SizedBox(height: 20), // Spacing
          HorizontalListView(
            title: "Top 10",
            apiUrl:
                "${ApiConfig.tmdbApiBaseUrl}trending/movie/day?api_key=${ApiConfig.tmdbApiKey}&page=1",
          ), // Horizontal list view
          // Add more widgets as needed
        ],
      ),
    );
  }
}
