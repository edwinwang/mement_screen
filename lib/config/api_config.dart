class ApiConfig {
  static const String tmdbApiBaseUrl = 'https://api.themoviedb.org/3/';

  static const String tmdbApiKey = '8d6d91941230817f7807d643736e8a49';

  static const String tmdbApiLanguage = 'en-US';

  static const String tmdbApiRegion = 'US';

  static const String tmdbApiImageBaseUrl = 'https://image.tmdb.org/t/p/';

  static const String tmdbApiImageSizeBackdrop = 'w1280';

  static const String tmdbApiImageSizePoster = 'w154';

  static const String tmdbApiImageSizeProfile = 'w185';

  static const String tmdbApiImageSizeLogo = 'w45';

  static const String tmdbApiImageSizeW500 = 'w500';

  static String tmdbApiMovieDetail(String movieId) {
    return '${tmdbApiBaseUrl}movie/$movieId?api_key=$tmdbApiKey&append_to_response=credits';
  }

  static String tmdbApiMovieDayTrending() {
    return '${tmdbApiBaseUrl}trending/movie/day?api_key=$tmdbApiKey&page=1';
  }

  static String tmdbApiMovieBackdrop(String movieId) {
    return '$tmdbApiImageBaseUrl$tmdbApiImageSizeBackdrop$movieId';
  }
}
