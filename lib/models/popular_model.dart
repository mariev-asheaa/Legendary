class PopularModel {
  PopularModel({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  PopularModel.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;


PopularModel copyWith({  num? page,
  List<Results>? results,
  num? totalPages,
  num? totalResults,
}) => PopularModel(  page: page ?? this.page,
  results: results ?? this.results,
  totalPages: totalPages ?? this.totalPages,
  totalResults: totalResults ?? this.totalResults,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}

class Results {
  Results({
      this.adult, 
      this.gender, 
      this.id, 
      this.knownForDepartment, 
      this.name, 
      this.originalName, 
      this.popularity, 
      this.profilePath, 
      this.knownFor,});

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    if (json['known_for'] != null) {
      knownFor = [];
      json['known_for'].forEach((v) {
        knownFor?.add(KnownFor.fromJson(v));
      });
    }
  }
  bool? adult;
  num? gender;
  num? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  num? popularity;
  String? profilePath;
  List<KnownFor>? knownFor;
Results copyWith({  bool? adult,
  num? gender,
  num? id,
  String? knownForDepartment,
  String? name,
  String? originalName,
  num? popularity,
  String? profilePath,
  List<KnownFor>? knownFor,
}) => Results(  adult: adult ?? this.adult,
  gender: gender ?? this.gender,
  id: id ?? this.id,
  knownForDepartment: knownForDepartment ?? this.knownForDepartment,
  name: name ?? this.name,
  originalName: originalName ?? this.originalName,
  popularity: popularity ?? this.popularity,
  profilePath: profilePath ?? this.profilePath,
  knownFor: knownFor ?? this.knownFor,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['gender'] = gender;
    map['id'] = id;
    map['known_for_department'] = knownForDepartment;
    map['name'] = name;
    map['original_name'] = originalName;
    map['popularity'] = popularity;
    map['profile_path'] = profilePath;
    if (knownFor != null) {
      map['known_for'] = knownFor?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class KnownFor {
  KnownFor({
      this.backdropPath, 
      this.id, 
      this.name, 
      this.originalName, 
      this.overview, 
      this.posterPath, 
      this.mediaType, 
      this.adult, 
      this.originalLanguage, 
      this.genreIds, 
      this.popularity, 
      this.firstAirDate, 
      this.voteAverage, 
      this.voteCount, 
      this.originCountry,});

  KnownFor.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    name = json['name'];
    originalName = json['original_name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    adult = json['adult'];
    originalLanguage = json['original_language'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    popularity = json['popularity'];
    firstAirDate = json['first_air_date'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
  }
  String? backdropPath;
  num? id;
  String? name;
  String? originalName;
  String? overview;
  String? posterPath;
  String? mediaType;
  bool? adult;
  String? originalLanguage;
  List<num>? genreIds;
  num? popularity;
  String? firstAirDate;
  num? voteAverage;
  num? voteCount;
  List<String>? originCountry;
KnownFor copyWith({  String? backdropPath,
  num? id,
  String? name,
  String? originalName,
  String? overview,
  String? posterPath,
  String? mediaType,
  bool? adult,
  String? originalLanguage,
  List<num>? genreIds,
  num? popularity,
  String? firstAirDate,
  num? voteAverage,
  num? voteCount,
  List<String>? originCountry,
}) => KnownFor(  backdropPath: backdropPath ?? this.backdropPath,
  id: id ?? this.id,
  name: name ?? this.name,
  originalName: originalName ?? this.originalName,
  overview: overview ?? this.overview,
  posterPath: posterPath ?? this.posterPath,
  mediaType: mediaType ?? this.mediaType,
  adult: adult ?? this.adult,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  genreIds: genreIds ?? this.genreIds,
  popularity: popularity ?? this.popularity,
  firstAirDate: firstAirDate ?? this.firstAirDate,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
  originCountry: originCountry ?? this.originCountry,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['name'] = name;
    map['original_name'] = originalName;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['media_type'] = mediaType;
    map['adult'] = adult;
    map['original_language'] = originalLanguage;
    map['genre_ids'] = genreIds;
    map['popularity'] = popularity;
    map['first_air_date'] = firstAirDate;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    map['origin_country'] = originCountry;
    return map;
  }

}