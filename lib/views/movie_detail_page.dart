import 'package:flutter/material.dart';
import 'dart:convert';
import '../model/moive.dart';
import '../config/api_config.dart';
import 'package:http/http.dart' as http;

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  MovieDetail? movieDetail;
  bool isLoading = true;
  final String imgBasePath =
      '${ApiConfig.tmdbApiImageBaseUrl}${ApiConfig.tmdbApiImageSizeBackdrop}/';

  @override
  void initState() {
    super.initState();
    fetchMovieDetail();
  }

  Future<void> fetchMovieDetail() async {
    final response = await http.get(
      Uri.parse(ApiConfig.tmdbApiMovieDetail(widget.movieId.toString())),
    );

    if (response.statusCode == 200) {
      setState(() {
        movieDetail = MovieDetail.fromJson(json.decode(response.body));
        isLoading = false;
      });
    } else {
      // Handle error or set a state to show an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Stack(
              children: <Widget>[
                // Background image
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(ApiConfig.tmdbApiMovieBackdrop(
                          movieDetail!.backdropPath!)),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                    decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black54,
                      Colors.transparent,
                      Colors.black87,
                    ],
                  ),
                )),
                // Content
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Top back button
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          // Handle back action
                          Navigator.pop(context);
                        },
                      ),
                      // Center play button and movie details
                      Positioned(
                        left: 16.0,
                        right: 16.0,
                        bottom: 16.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // 电影信息
                            Text(
                              movieDetail?.getFormattedDateAndRuntime() ?? "",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 4.0), // 添加一点垂直间距
                            // 电影标题
                            Text(
                              movieDetail?.title ?? "",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 4.0), // 添加一点垂直间距
                            // 类型标签
                            Text(
                              movieDetail?.getFormattedGenres() ?? "",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 16.0), // 添加一点垂直间距
                            // 底部的图标和文字
                            Row(
                              children: <Widget>[
                                // CC图标和文字
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 2.0),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    'CC',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                const SizedBox(width: 8.0), // 添加一点水平间距
                                // R图标和文字
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 2.0),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    'R',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Bottom icons and labels
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Text("text"),
        ],
      ),
    );
  }
}
