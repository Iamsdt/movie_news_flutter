import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Result {
  bool adult;
  String backdrop_path;
  String first_air_date;
  List<int> genre_ids;
  int id;
  String media_type;
  String name;
  List<String> origin_country;
  String original_language;
  String original_name;
  String original_title;
  String overview;
  double popularity;
  String poster_path;
  String release_date;
  String title;
  bool video;
  double vote_average;
  int vote_count;

  Result(
      {this.adult,
      this.backdrop_path,
      this.first_air_date,
      this.genre_ids,
      this.id,
      this.media_type,
      this.name,
      this.origin_country,
      this.original_language,
      this.original_name,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.release_date,
      this.title,
      this.video,
      this.vote_average,
      this.vote_count});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      adult: json['adult'],
      backdrop_path: json['backdrop_path'],
      first_air_date: json['first_air_date'],
      genre_ids: json['genre_ids'] != null
          ? new List<int>.from(json['genre_ids'])
          : null,
      id: json['id'],
      media_type: json['media_type'],
      name: json['name'],
      origin_country: json['origin_country'] != null
          ? new List<String>.from(json['origin_country'])
          : null,
      original_language: json['original_language'],
      original_name: json['original_name'],
      original_title: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      title: json['title'],
      video: json['video'],
      vote_average: json['vote_average'],
      vote_count: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdrop_path;
    data['first_air_date'] = this.first_air_date;
    data['id'] = this.id;
    data['media_type'] = this.media_type;
    data['name'] = this.name;
    data['original_language'] = this.original_language;
    data['original_name'] = this.original_name;
    data['original_title'] = this.original_title;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.poster_path;
    data['release_date'] = this.release_date;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.vote_average;
    data['vote_count'] = this.vote_count;
    if (this.genre_ids != null) {
      data['genre_ids'] = this.genre_ids;
    }
    if (this.origin_country != null) {
      data['origin_country'] = this.origin_country;
    }
    return data;
  }
}
