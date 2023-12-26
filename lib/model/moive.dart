class MovieDetail {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genre>? genres;
  String? homepage;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompany>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  Credits? credits;

  // 添加构造函数
  MovieDetail({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.credits,
  });

  // 将 JSON 转换为 MovieDetail 对象
  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] as String?,
      belongsToCollection: json['belongs_to_collection'] != null
          ? BelongsToCollection.fromJson(json['belongs_to_collection'])
          : null,
      budget: json['budget'] as int?,
      genres: json['genres'] == null
          ? null
          : List<Genre>.from(
              json['genres'].map((genre) => Genre.fromJson(genre))),
      homepage: json['homepage'] as String?,
      imdbId: json['imdb_id'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: json['popularity'] as double?,
      posterPath: json['poster_path'] as String?,
      productionCompanies: json['production_companies'] == null
          ? null
          : List<ProductionCompany>.from(json['production_companies']
              .map((company) => ProductionCompany.fromJson(company))),
      productionCountries: json['production_countries'] == null
          ? null
          : List<ProductionCountry>.from(json['production_countries']
              .map((country) => ProductionCountry.fromJson(country))),
      releaseDate: json['release_date'] as String?,
      revenue: json['revenue'] as int?,
      runtime: json['runtime'] as int?,
      spokenLanguages: json['spoken_languages'] == null
          ? null
          : List<SpokenLanguage>.from(json['spoken_languages']
              .map((language) => SpokenLanguage.fromJson(language))),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: json['vote_average'] as double?,
      voteCount: json['vote_count'] as int?,
      credits:
          json['credits'] != null ? Credits.fromJson(json['credits']) : null,
    );
  }

  String getFormattedDateAndRuntime() {
    // 从releaseDate中提取年份
    String formattedDate =
        releaseDate != null ? releaseDate!.substring(0, 4) : "2000";

    // 将运行时间转换为小时和分钟
    String formattedRuntime = "0h 0min";
    if (runtime != null) {
      int hours = runtime! ~/ 60;
      int minutes = runtime! % 60;
      formattedRuntime = "${hours}h ${minutes}min";
    }

    return "$formattedDate • $formattedRuntime";
  }

  String getFormattedGenres() {
    if (genres == null || genres!.isEmpty) {
      return "";
    }
    return genres!
        .map((genre) => genre.name ?? '')
        .where((name) => name.isNotEmpty)
        .join(' • ');
  }
}

class Genre {
  int? id;
  String? name;

  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }
}

class ProductionCompany {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'] as int?,
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );
  }
}

class ProductionCountry {
  String? iso3166_1;
  String? name;

  ProductionCountry({
    this.iso3166_1,
    this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso3166_1: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );
  }
}

class SpokenLanguage {
  String? englishName;
  String? iso639_1;
  String? name;

  SpokenLanguage({
    this.englishName,
    this.iso639_1,
    this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json['english_name'] as String?,
      iso639_1: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );
  }
}

class BelongsToCollection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json['id'] as int?,
      name: json['name'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
    );
  }
}

class Cast {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      adult: json['adult'],
      gender: json['gender'] as int?,
      id: json['id'] as int?,
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      popularity: json['popularity']?.toDouble(),
      profilePath: json['profile_path'] as String?,
      castId: json['cast_id'] as int?,
      character: json['character'] as String?,
      creditId: json['credit_id'] as String?,
      order: json['order'] as int?,
    );
  }
}

class Crew {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      adult: json['adult'],
      gender: json['gender'] as int?,
      id: json['id'] as int?,
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      popularity: json['popularity']?.toDouble(),
      profilePath: json['profile_path'] as String?,
      creditId: json['credit_id'] as String?,
      department: json['department'] as String?,
      job: json['job'] as String?,
    );
  }
}

class Credits {
  List<Cast>? cast;
  List<Crew>? crew;

  Credits({
    this.cast,
    this.crew,
  });

  factory Credits.fromJson(Map<String, dynamic> json) {
    return Credits(
      cast: json['cast'] == null
          ? null
          : List<Cast>.from(json['cast'].map((x) => Cast.fromJson(x))),
      crew: json['crew'] == null
          ? null
          : List<Crew>.from(json['crew'].map((x) => Crew.fromJson(x))),
    );
  }
}
