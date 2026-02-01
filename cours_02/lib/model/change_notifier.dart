import 'package:flutter/widgets.dart';
import 'package:formation_flutter/model/product.dart';

class ProduitNotifier extends ChangeNotifier {
  Product? _produit;

  Product? getProduit() {
    return _produit;
  }

  ProduitNotifier() {
    loadProduit();
  }

  void loadProduit() {
    _produit = generateProduct();
    notifyListeners();
  }
}
