import 'package:flutter/material.dart';
import 'package:moviedb/resources/resources.dart';
import 'package:moviedb/ui/widgets/elements/radial_percent_widget.dart';

class MovieDetalisMainInfoWidget extends StatelessWidget {
  const MovieDetalisMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPosterWidget(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: MovieNameWidget(),
        ),
        _ScoreWidget(),
        _SummaryWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _OverViewWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(.0),
          child: _DiscriptionWidget(),
        ),
      ],
    );
  }
}

class _DiscriptionWidget extends StatelessWidget {
  const _DiscriptionWidget();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Рин Окимура и его брат Юкио — сироты, росшие в храме священника и экзорциста Фудзимото. Рин — парень неплохой, но вспыльчивый, придурковатый и постоянно ввязывающийся в драки. Юкио же наоборот, умный, прилежный и мечтающий стать врачом (и лечение извечных ссадин брата ему в этом лишь помогает,Но в реальности разница между ними куда сильнее: на самом деле Рин — полудемон, и не просто полудемон, а сын самого Сатаны. И когда, вопреки предосторожностям Фудзимото, силы Рина прорезаются наружу, папенька находит его и пытается забрать домой, чтобы в дальнейшем использовать сына в качестве плацдарма для захвата нашего измерения.).',
      maxLines: 5,
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
    );
  }
}

class _OverViewWidget extends StatelessWidget {
  const _OverViewWidget();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Обзор',
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage(AppImages.ekzarcist)),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(image: AssetImage(AppImages.nkar1)),
        )
      ],
    );
  }
}

class MovieNameWidget extends StatelessWidget {
  const MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: TextSpan(children: [
        TextSpan(
          text: 'Синий Экзорцист',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 21),
        ),
        TextSpan(
          text: '  (2011)',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
        )
      ]),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(
                    width: 50,
                    height: 50,
                    child: RadealPercentWidget(
                        percent: 0.79,
                        fillColor: Color.fromARGB(225, 10, 23, 25),
                        lineColor: Color.fromARGB(225, 37, 203, 103),
                        freeColor: Color.fromARGB(225, 23, 54, 31),
                        lineWidth: 3,
                        child: Text('79'))),
                SizedBox(
                  height: 10,
                ),
                Text('Рейтинг'),
              ],
            )),
        Container(
          color: Colors.grey,
          width: 1,
          height: 15,
        ),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.play_arrow),
                Text('Воспроизвести трейлер'),
              ],
            ))
      ],
    );
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
        child: Text(
          'мультфильм, НФ и Фэнтези, детектив, Боевик и Приключения',
          textAlign: TextAlign.center,
          maxLines: 3,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
