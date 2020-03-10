// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:movie_news/pages/main_page.dart';
import 'package:movie_news/pages/details_page.dart';
import 'package:movie_news/repo/model/Result.dart';

class MyRoute {
  static const mainPage = '/';
  static const details = '/details';
  static final navigator = ExtendedNavigator();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case MyRoute.mainPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => MainPage(),
          settings: settings,
        );
      case MyRoute.details:
        if (hasInvalidArgs<Result>(args)) {
          return misTypedArgsRoute<Result>(args);
        }
        final typedArgs = args as Result;
        return MaterialPageRoute<dynamic>(
          builder: (_) => Details(typedArgs),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
