import 'package:flutter/material.dart';
import 'package:moviedb/ui/widgets/auth/auth_model.dart';
import 'package:moviedb/ui/widgets/auth/auth_widget.dart';
import 'package:moviedb/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:moviedb/ui/widgets/movie_detalis/movie_detalis_widget.dart';

abstract class MainNavigationRouteNames {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const moviedetalis = '/movie_detalis';
}

class MainNavigation {
  String initalRoute(bool isAuth) => isAuth
      ? MainNavigationRouteNames.mainScreen
      : MainNavigationRouteNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => AuthProvider(
          model: AuthModel(),
          child: AuthWidget(),
        ),
    MainNavigationRouteNames.mainScreen: (context) => MainScreenWidget(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.moviedetalis:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => MovieDetalisWidget(
            movieId: movieId,
          ),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
