import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/models/faves_model.dart';

import 'package:provider_practice/widgets/film_item.dart';

class FavesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var faves = Provider.of<FavesModel>(context);
    var favesCount = faves.length;

    if (favesCount == 0) {
      var style = Theme.of(context).textTheme.headline6;
      return Center(
        child: Text(
          'Not Item Selected',
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
                  var id = faves.getbyposition(position).episodeId;
                  return FilmItem(id);
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
        Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white);

    return Container(
      color: Theme.of(context).accentColor,
      child: SizedBox(
        height: 40,
        child: Center(child: Consumer<FavesModel>(
          builder: (_, faves, __) {
            var label = faves.length == 1 ? 'favourite' : 'favourites';
            return Text(
              '${faves.length} $label',
              style: textStyle,
            );
          },
        )),
      ),
    );
  }
}
