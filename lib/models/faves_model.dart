import 'package:flutter/foundation.dart';
import 'package:provider_practice/models/films.dart';

class FavesModel extends ChangeNotifier {
  final FilmsModel _film;
  final List<int> _episodeIds;

  FavesModel(this._film, FavesModel previous)
      : assert(_film != null),
        _episodeIds = previous?._episodeIds ?? [];

  List<Film> get films => _episodeIds.map((e) => _film.getById(e)).toList();
  Film getbyposition(int position) => films[position];

  void add(Film film) {
    _episodeIds.add(film.episodeId);
    notifyListeners();
  }

  void remove(Film film) {
    _episodeIds.remove(film.episodeId);
    notifyListeners();
  }
}
