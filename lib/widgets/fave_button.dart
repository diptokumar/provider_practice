
import 'package:flutter/material.dart';
import 'package:provider_practice/models/films.dart';


class FaveButton extends StatelessWidget {
  final Film film;

  const FaveButton({Key key, @required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => null,
      splashColor: Theme.of(context).primaryColor,
      child: Icon(Icons.star_border),
    );
  }
}
