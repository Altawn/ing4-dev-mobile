import 'package:flutter/widgets.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:dio/dio.dart';

class ProduitNotifier extends ChangeNotifier {
  Product? _produit;
  final dio = Dio();

  Product? getProduit() => _produit;

  ProduitNotifier() {
    loadProduit();
  }

  Future<void> loadProduit() async {
    try {
      final response = await dio.get(
        'https://api.formation-flutter.fr/v2/getProduct?barcode=5000159484695',
      );

      final Map<String, dynamic> data = response.data;
      final apiResponse = Response.fromJSON(data);

      // Conversion ApiProduct -> Product (UI)
      _produit = _convertApiProductToProduct(apiResponse.produit);
      notifyListeners();
    } catch (e) {
      debugPrint('Erreur lors du chargement du produit: $e');
    }
  }

  Product _convertApiProductToProduct(ApiProduct apiProduct) {
    return Product(
      barcode: apiProduct.barcode,
      name: apiProduct.name,
      altName: apiProduct.altName,
      picture: apiProduct.image,
      quantity: '', // Pas dans l'objet ApiProduct simplifié
      brands: apiProduct.brands.cast<String>(),
      manufacturingCountries: [],
      // Conversion des scores String/Int vers Enums
      nutriScore: ProductNutriScore.fromJSON(apiProduct.nutriscore),
      novaScore: ProductNovaScore.fromJSON(apiProduct.novaScore),
      greenScore: ProductGreenScore.fromJSON(apiProduct.greenScore),
      ingredients: [],
    );
  }
}

class Response {
  final ApiProduct produit;

  Response.fromJSON(Map<String, dynamic> json)
    : produit = ApiProduct.fromJSON(json['response']);
}

class ApiProduct {
  final String name;
  final String image;
  final String barcode;
  final List brands;
  final String altName;
  final String nutriscore;
  final int novaScore;
  final String greenScore;

  ApiProduct.fromJSON(Map<String, dynamic> json)
    : name = json['name'] ?? '',
      image = json['pictures']?['product'] ?? '',
      barcode = json['barcode'] ?? '',
      brands = json['brands'] ?? [],
      altName = json['altName'] ?? '',
      nutriscore = json['nutriScore'] ?? '',
      novaScore = json['novaScore'] is int ? json['novaScore'] : -1,
      greenScore = json['ecoScoreGrade'] ?? '';
}
