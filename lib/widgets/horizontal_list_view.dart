import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/api_config.dart';
import '../views/movie_detail_page.dart';

class HorizontalListView extends StatefulWidget {
  final String apiUrl;
  final String title;

  const HorizontalListView(
      {super.key, required this.title, required this.apiUrl});

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  // final List<String> items = List.generate(10, (index) => "Item $index");
  final String imageBasePath =
      '${ApiConfig.tmdbApiImageBaseUrl}${ApiConfig.tmdbApiImageSizePoster}/';
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(widget.apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          items = data['results'];
        });
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              InkWell(
                onTap: () {},
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                  child: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
            ],
          ),
        ),
        items.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                height: 231,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    var item = items[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailPage(movieId: item['id']),
                          ),
                        );
                      },
                      child: Container(
                        width: 154,
                        margin: const EdgeInsets.all(4),
                        child: Image.network(
                          "$imageBasePath${item['poster_path']}", // Replace with actual image path from your data
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Icon(Icons
                                .error); // Show error icon if image fails to load
                          },
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
