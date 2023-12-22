class MediaItem {
  final bool adult;
  final String backdropPath;
  final int id;
  final String title;
  final String originalLanguage;
  final String overview;
  final String posterPath;
  final String mediaType;
  final List<int> genreIds;
  final double popularity;
  final double voteAverage;
  final int voteCount;

  MediaItem({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  });
}

class Movie extends MediaItem {
  final String releaseDate;
  final bool video;

  Movie({
    required super.adult,
    required super.backdropPath,
    required super.id,
    required super.title,
    required super.originalLanguage,
    required super.overview,
    required super.posterPath,
    required super.mediaType,
    required super.genreIds,
    required super.popularity,
    required super.voteAverage,
    required super.voteCount,
    required this.releaseDate,
    required this.video,
  });
}

class TVShow extends MediaItem {
  final String firstAirDate;
  final List<String> originCountry;

  TVShow({
    required super.adult,
    required super.backdropPath,
    required super.id,
    required super.title,
    required super.originalLanguage,
    required super.overview,
    required super.posterPath,
    required super.mediaType,
    required super.genreIds,
    required super.popularity,
    required super.voteAverage,
    required super.voteCount,
    required this.firstAirDate,
    required this.originCountry,
  });
}
