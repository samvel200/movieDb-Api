import 'package:flutter/material.dart';
import 'package:moviedb/resources/resources.dart';
import 'package:moviedb/ui/navigation/main_navigation.dart';

class Movie {
  final int id;
  final String imagename;
  final String title;
  final String time;
  final String description;

  Movie(
      {required this.id,
      required this.imagename,
      required this.title,
      required this.time,
      required this.description});
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        id: 1,
        imagename: AppImages.nkar1,
        title: 'Синий Экзорцист',
        time: '17 апр 2011',
        description:
            'Рин Окимура и его брат Юкио — сироты, росшие в храме священника'),
    Movie(
        id: 2,
        imagename: AppImages.kalmar,
        title: 'Игра в кальмара',
        time: '17 сен 2021',
        description:
            'Из-за нужды в деньгах сотни игроков принимают странное приглашение'),
    Movie(
        id: 3,
        imagename: AppImages.nasferatu,
        title: 'Носферату',
        time: '25 дек 2024',
        description:
            'История о преследуемой призраками девушке и влюбленном в неё вампире.'),
    Movie(
        id: 4,
        imagename: AppImages.katu,
        title: 'Течение',
        time: '30 янв 2024',
        description:
            'Кот просыпается в мире, погруженном в воду, в котором не осталось людей'),
    Movie(
        id: 5,
        imagename: AppImages.matanuTirakal,
        title: 'Властелин Колец: Война Рохирримов',
        time: '05 дек 2024',
        description:
            'Внезапное нападение Вульфа, умного и безжалостного лорда Данленда'),
    Movie(
        id: 6,
        imagename: AppImages.mufasta,
        title: 'Муфаса: Король Лев',
        time: '18 дек 2024',
        description:
            'Осиротевший Муфаса знакомится с наследником королевских кровей по имени Така')
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.moviedetalis, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Colors.black.withValues(alpha: 0.2)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2))
                        ]),
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image(image: AssetImage(movie.imagename)),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  movie.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  movie.time,
                                  style: TextStyle(color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  movie.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => onMovieTap(index)),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                labelText: 'поиск',
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                border: OutlineInputBorder()),
          ),
        )
      ],
    );
  }
}
