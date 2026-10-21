class PopularModel {
  String backdropPath;
  int id;
  String title;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  double voteAverage;
  int voteCount;

  PopularModel({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory PopularModel.fromMap(Map<String, dynamic> mapa) {
    return PopularModel(
      backdropPath: mapa[''],
      id: mapa['id'],
      title: mapa['title'],
      originalLanguage: mapa['original_language'],
      originalTitle: mapa['original_title'],
      overview: mapa['overview'],
      popularity: mapa['popularity'],
      posterPath: mapa['poster_path'],
      releaseDate: mapa['release_date'],
      voteAverage: mapa['vote_average'],
      voteCount: mapa['vote_count']
    );
  }

}