import 'package:flutter/material.dart';
import 'package:off/api/model/product_response.dart';
import 'package:off/api/openfoodfacts_api.dart';
import 'package:off/model/product.dart';

class ProductNotifier extends ChangeNotifier {
  ProductNotifier({required this.barcode}) : _product = null {
    loadProduct();
  }

  final String barcode;
  Product? _product;

  Future<void> loadProduct() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    final ProductAPIEntity product = await OpenFoodFactsAPIManager()
        .loadProduct(barcode);
    _product = product.response?.toProduct();
    notifyListeners();
  }

  Product? get product => _product;
}
