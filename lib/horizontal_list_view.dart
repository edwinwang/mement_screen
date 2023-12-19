import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  final List<String> items = List.generate(10, (index) => "Item $index");

  HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle navigation to detailed page
            },
            child: Container(
              width: 160,
              margin: const EdgeInsets.all(5),
              child: Image.network(
                'https://via.placeholder.com/160x120',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
