import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/models/films.dart';
import 'package:provider_practice/widgets/film_item.dart';

class FilmsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var film = Provider.of<FilmsModel>(context);
    return ListView.builder(
      itemCount: film.length,
      itemBuilder: (BuildContext context, int position)=> FilmItem(position +1) ,

    );
  }
}
