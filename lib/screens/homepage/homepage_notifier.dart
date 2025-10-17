import 'package:flutter/widgets.dart';
import 'package:off/model/product.dart';

class HomepageNotifier extends ChangeNotifier {
  HomepageNotifier() : _products = <Product>[];

  final List<Product> _products;

  void addToHistory(Product product) {
    _products.add(product);
    notifyListeners();
  }

  List<Product> get products => List<Product>.unmodifiable(_products);

  bool get hasScans => _products.isNotEmpty;
}
