import 'package:flutter/foundation.dart';
import 'package:provider_practice/models/films.dart';

class FavesModel extends ChangeNotifier {
  final FilmsModel _film;
  final List<int> _episodeids;

  FavesModel(this._film, FavesModel previous)
      : assert(_film != null),
        _episodeids = previous?._episodeids ?? [];
  List<Film> get films => _episodeids.map((e) => _film.getById(e)).toList();
  Film getbyposition(int position) => films[position];

  void add(Film film){
    _episodeids.add(film.episodeId);
    notifyListeners();
  }
  void remove(Film film){
    _episodeids.remove(film.episodeId);
    notifyListeners();
  }
}
