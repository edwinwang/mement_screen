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
      Uri.parse(
          '${ApiConfig.tmdbApiBaseUrl}/movie/${widget.movieId}?api_key=${ApiConfig.tmdbApiKey}'),
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
      body: Stack(
        children: <Widget>[
          // Background image
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("$imgBasePath${movieDetail?.backdropPath}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Black gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),
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
                Column(
                  children: <Widget>[
                    // Movie title and other details
                    Text(
                      movieDetail?.title ?? '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    // Movie attributes
                    const Text(
                      '',
                      style: TextStyle(fontSize: 16),
                    ),
                    // Play button
                    IconButton(
                      icon: const Icon(Icons.play_circle_filled),
                      iconSize: 64,
                      onPressed: () {
                        // Handle play action
                      },
                    ),
                    // Movie description
                    Text(
                      movieDetail?.overview ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    // Director and cast
                    const Text(
                      'Directed by Wu Ma\nStarring Meng Fei, Chen Xing, Lu Yi Lung',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                // Bottom icons and labels
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            // Add to My List action
                          },
                        ),
                        const Text('My List')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.thumb_down),
                          onPressed: () {
                            // Not for Me action
                          },
                        ),
                        const Text('Not for Me')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.thumb_up),
                          onPressed: () {
                            // Like movie action
                          },
                        ),
                        const Text('Like')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () {
                            // Share movie action
                          },
                        ),
                        const Text('Share')
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
