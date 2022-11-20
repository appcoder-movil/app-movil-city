
import 'package:app_movil_city/models/local_favorite.dart';
import 'package:hive/hive.dart';

class Boxes{
  static Box<LocalFavorite> getFavoritesBox() => Hive.box<LocalFavorite>('favorites');
}