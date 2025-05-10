import 'package:flutter/material.dart';
import 'package:moviedb/ui/widgets/movie_detalis/movie_detalis_main_info_widget.dart';
import 'package:moviedb/ui/widgets/movie_detalis/movie_detlis_main_screen_cast_widget.dart';

class MovieDetalisWidget extends StatefulWidget {
  final int movieId;
  const MovieDetalisWidget({super.key, required this.movieId});

  @override
  State<MovieDetalisWidget> createState() => _MovieDetalisWidgetState();
}

class _MovieDetalisWidgetState extends State<MovieDetalisWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Синий Экзорцист',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ColoredBox(
        color: Color.fromRGBO(24, 23, 27, 1.0),
        child: ListView(
          children: [
            MovieDetalisMainInfoWidget(),
            SizedBox(
              height: 30,
            ),
            MovieDetlisMainScreenCastWidget()
          ],
        ),
      ),
    );
  }
}
