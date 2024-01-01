import 'package:flutter/material.dart';
import 'dart:convert';
import '../model/moive.dart';
import '../config/api_config.dart';
import '../widgets/horizontal_list_credits.dart';
import '../widgets/horizontal_list_view.dart';
import '../widgets/video_player_screen.dart';
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
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Stack(
                children: [
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
                        Colors.black,
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
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const SizedBox(height: 4.0), // 添加一点垂直间距
                              // 电影标题
                              Text(
                                movieDetail?.title ?? "",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 4.0), // 添加一点垂直间距
                              // 类型标签
                              Text(
                                movieDetail?.getFormattedGenres() ?? "",
                                style: Theme.of(context).textTheme.labelMedium,
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
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Column(children: [
                  // 电影简介
                  Text(
                    movieDetail?.overview ?? "",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ])),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Assuming icons are placeholders and should be replaced with actual icons
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(
                          Icons.playlist_add_outlined,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.thumb_down_outlined,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.play_circle_filled,
                          size: 48.0,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VideoPlayerScreen(
                                  videoUrl:
                                      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4'),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.thumb_up_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.share_outlined,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height: 20), // Spacing between the row and the button
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Watch Trailer'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            HorizontalListCredits(
              title: 'Cast',
              items: movieDetail?.credits?.cast ?? [],
            ),
            const SizedBox(
              height: 20,
            ),
            HorizontalListView(
              title: 'Recommendations',
              apiUrl: ApiConfig.tmdbApiMovieRecommendation(
                  widget.movieId.toString()),
              scaleFactor: 0.6,
              showMoreButton: false,
            )
          ],
        ),
      ),
    );
  }
}
