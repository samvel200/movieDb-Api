import 'package:flutter/material.dart';
import 'package:moviedb/ui/Theme/app_colors.dart';
import 'package:moviedb/ui/navigation/main_navigation.dart';
import 'package:moviedb/ui/widgets/auth/auth_model.dart';
import 'package:moviedb/ui/widgets/auth/auth_widget.dart';
import 'package:moviedb/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:moviedb/ui/widgets/movie_detalis/movie_detalis_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.mainDarkBlue,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.mainDarkBlue,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey)),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initalRoute(false),
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
