import 'package:flutter/material.dart';
import 'package:tasks/models/popular_model.dart';
import 'package:tasks/services/popular_request.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<int> _favoriteItems = [];

  List<int> get favoriteItems => _favoriteItems;

  void addFavorite(num id) {
    _favoriteItems.add(id.toInt());
    notifyListeners();
  }

  void removeFavorite(num id) {
    _favoriteItems.remove(id);
    notifyListeners();
  }
}



class PopularProvider with ChangeNotifier {
  List<PopularModel> _popularItems = []; // Your data source

  List<PopularModel> get popularItems => _popularItems;

  // Example method to fetch popular items
  Future<void> fetchPopularItems() async {

    _popularItems = (await getdata()) as List<PopularModel>;
    notifyListeners();
  }
}
