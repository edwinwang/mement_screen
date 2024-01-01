import 'package:flutter/material.dart';

import '../config/api_config.dart';

class HorizontalListCredits extends StatelessWidget {
  final String imageBasePath =
      '${ApiConfig.tmdbApiImageBaseUrl}${ApiConfig.tmdbApiImageSizeProfile}/';
  final List<dynamic> items;
  final String title;

  const HorizontalListCredits(
      {super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: ClipOval(
                    child: item.profilePath?.isNotEmpty == true
                        ? Image.network(
                            "$imageBasePath${item.profilePath}", // Replace with actual image path from your data
                            fit: BoxFit.cover,
                            width: 64,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Icon(Icons
                                  .error); // Show error icon if image fails to load
                            },
                          )
                        : Text(item.name),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
