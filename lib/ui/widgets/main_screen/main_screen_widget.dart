import 'package:flutter/material.dart';
import 'package:moviedb/ui/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Text(
            'TMDB',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: IndexedStack(index: _selectedTab, children: [
        Text('Hовости'),
        MovieListWidget(),
        Text('Cериалы'),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hовости'),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_filter), label: 'Фильмы '),
            BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Cериалы'),
          ],
          onTap: onSelectedTab),
    );
  }
}
