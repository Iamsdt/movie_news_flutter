// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyRestService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$MyRestService extends MyRestService {
  _$MyRestService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MyRestService;

  @override
  Future<Response<dynamic>> getMovies(String apiKey) {
    final $url = '/3/trending/movie/day';
    final $params = <String, dynamic>{'api_key': apiKey};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getMovieDetails(int id, String apiKey) {
    final $url = '/3/movie/$id';
    final $params = <String, dynamic>{'api_key': apiKey};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
