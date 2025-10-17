import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:off/model/product.dart';
import 'package:off/repositories/product_repository.dart';

@injectable
class ProductNotifier extends ChangeNotifier {
  ProductNotifier({
    @factoryParam required this.barcode,
    IProductRepository? repository,
  }) : _repository = repository ?? ProductRepository() {
    loadProduct();
  }
  final IProductRepository _repository;

  final String barcode;
  Product? _product;

  Future<void> loadProduct() async {
    _product = await _repository.getProduct(barcode);
    notifyListeners();
  }

  Product? get product => _product;
}
