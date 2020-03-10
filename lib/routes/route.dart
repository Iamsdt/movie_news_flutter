import 'package:auto_route/auto_route_annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:movie_news/pages/details_page.dart';
import 'package:movie_news/pages/main_page.dart';

@MaterialAutoRouter()
class $MyRoute {
  @initial
  MainPage mainPage;
  @CustomAutoRouter(
      transitionsBuilder: TransitionsBuilders.zoomIn,
      durationInMilliseconds: 500)
  Details details;
}
