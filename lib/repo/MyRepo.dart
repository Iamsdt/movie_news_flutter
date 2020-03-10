import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:movie_news/APIKey.dart';
import 'package:movie_news/repo/model/MovieDetails.dart';
import 'package:movie_news/repo/model/Movies.dart';

import 'MyRestService.dart';

class MyRepo {
  MyRestService _service;
  Movies _movies;
  MovieDetails _movieDetails;

  MyRepo() {
    _service = MyRestService.create(getClient());
  }

  getClient() {
    return ChopperClient(
      //todo change production
      baseUrl: "https://api.themoviedb.org",
      converter: JsonConverter(),
      services: [
        // the generated service
        MyRestService.create()
      ],
    );
  }

  void getMovies() async {
    if (_service == null) {
      _service = MyRestService.create(getClient());
    }
    var response = await _service.getMovies(APIKey.APIKEY);
    _movies = Movies.fromJson(jsonDecode(response.bodyString));
  }

  void getDetails(id) async {
    //todo
  }

  MovieDetails get movieDetails => _movieDetails;

  Movies get movies => _movies;
}
