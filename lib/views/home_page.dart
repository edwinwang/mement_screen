import 'package:flutter/material.dart';
import '../widgets/carousel_with_indicator.dart'; // Custom widget for carousel
import '../widgets/horizontal_list_view.dart'; // Custom widget for horizontal list view
import '../config/ui_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CarouselWithIndicator(), // Carousel widget
          const SizedBox(height: 20), // Spacing
          HorizontalListView(
            title: UIConfig.moiveDayTrending['title']!,
            apiUrl: UIConfig.moiveDayTrending['apiUrl']!,
          ),
        ],
      ),
    );
  }
}
