import 'package:flutter/material.dart';
import 'package:off/model/product.dart';

class ProductProvider extends InheritedWidget {
  const ProductProvider({
    required this.product,
    required super.child,
    super.key,
  });

  final Product product;

  static ProductProvider of(BuildContext context) {
    final ProductProvider? result = context
        .dependOnInheritedWidgetOfExactType<ProductProvider>();
    assert(result != null, 'No ColorProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProductProvider old) {
    return product != old.product;
  }
}
