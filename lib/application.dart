import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/models/films.dart';
import 'package:provider_practice/pages/faves_page.dart';
import 'package:provider_practice/pages/films_page.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _selectedIndex = 0;
  final _appBarTitles = [
    Text('Films'),
    Text('Faves'),
  ];
  var _appBarTitleText = Text('Films');

  final _pageOptions = [
    FilmsPage(),
    FavesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(builder: (context) => FilmsModel(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trilogies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: _appBarTitleText,
          ),
          body: _pageOptions[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
                _appBarTitleText = _appBarTitles[index];
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'Films',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Faves',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
