import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/api_config.dart';
import '../views/movie_detail_page.dart';

class HorizontalListView extends StatefulWidget {
  final String apiUrl;
  final String title;
  final double scaleFactor;
  final bool showMoreButton;

  const HorizontalListView(
      {super.key,
      required this.title,
      required this.apiUrl,
      this.scaleFactor = 1.0,
      this.showMoreButton = true});

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  final String imageBasePath =
      '${ApiConfig.tmdbApiImageBaseUrl}${ApiConfig.tmdbApiImageSizePoster}/';
  List<dynamic> items = [];
  bool isHiden = false;

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
          if (items.isEmpty) {
            isHiden = true;
          }
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
    return isHiden
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    widget.showMoreButton
                        ? InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, top: 5, bottom: 5),
                              child: Icon(Icons.arrow_forward_ios, size: 16),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              items.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: 231 * widget.scaleFactor,
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
                              width: 154 * widget.scaleFactor,
                              margin: const EdgeInsets.all(4),
                              child: item['poster_path']?.isNotEmpty == true
                                  ? Image.network(
                                      "$imageBasePath${item['poster_path']}", // Replace with actual image path from your data
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return const Icon(Icons
                                            .error); // Show error icon if image fails to load
                                      },
                                    )
                                  : Text(item['title']),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          );
  }
}
