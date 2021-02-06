
import 'package:flutter/material.dart';
import 'package:provider_practice/widgets/film_item.dart';

class FavesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favesCount = 0;

    if (favesCount == 0) {
      var style = Theme.of(context).textTheme.title;
      return Center(
        child: Text(
          'Faves',
          style: style,
        ),
      );
    }

    return Container(
      child: Column(
        children: <Widget>[
          _FavesSize(),
          Divider(height: 4, color: Colors.black),
          Expanded(
            child: ListView.builder(
                itemCount: favesCount,
                itemBuilder: (BuildContext context, int position) {
                  return FilmItem(position);
                }),
          ),
        ],
      ),
    );
  }
}

class _FavesSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textStyle =
    Theme.of(context).textTheme.body1.copyWith(color: Colors.white);

    return Container(
      color: Theme.of(context).accentColor,
      child: SizedBox(
        height: 40,
        child: Center(child: Text('Faves Size', style: textStyle)),
      ),
    );
  }
}
