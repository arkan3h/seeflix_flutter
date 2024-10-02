import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeflix_flutter/core/di/injection_container.dart';
import 'package:seeflix_flutter/presentation/bloc/popular/popular_bloc.dart';
import 'package:seeflix_flutter/presentation/bloc/popular/popular_event.dart';
import 'package:seeflix_flutter/presentation/pages/main/bookmark/bookmarkpage.dart';
import 'package:seeflix_flutter/presentation/pages/main/home/homepage.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  MovieAppState createState() => MovieAppState();
}

class MovieAppState extends State<MovieApp> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<PopularBloc>()..add(FetchPopular()),
        ),
      ],
      child: const Homepage(),
    ),
    Bookmarkpage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SeeFlix'),
      ),
      body: _pages[_selectedIndex], // Mengganti halaman sesuai indeks
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
