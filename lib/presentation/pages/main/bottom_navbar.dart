import 'package:flutter/material.dart';
import 'package:seeflix_flutter/presentation/pages/main/bookmark/bookmarkpage.dart';
import 'package:seeflix_flutter/presentation/pages/main/home/homepage.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  int _selectedIndex = 0;

  // Daftar halaman untuk navigasi
  static List<Widget> _pages = <Widget>[
    Homepage(),
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