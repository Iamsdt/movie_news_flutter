import "dart:async";

import 'package:chopper/chopper.dart';

part 'MyRestService.chopper.dart';

//@RestApi(baseUrl: "https://api.themoviedb.org/3/", )
@ChopperApi(baseUrl: "/3")
abstract class MyRestService extends ChopperService {
  static MyRestService create([ChopperClient client]) =>
      _$MyRestService(client);

  @Get(path: "/trending/movie/day")
  Future<Response> getMovies(
    @Query("api_key") String apiKey,
  );

  @Get(path: "/movie/{id}")
  Future<Response> getMovieDetails(
      @Path() int id, @Query("api_key") String apiKey);
}
