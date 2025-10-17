import 'package:injectable/injectable.dart';
import 'package:off/api/model/product_response.dart';
import 'package:off/api/openfoodfacts_api.dart';
import 'package:off/model/product.dart';

abstract class IProductRepository {
  Future<Product> getProduct(String barcode);
}

@Singleton(as: IProductRepository)
class ProductRepository implements IProductRepository {
  ProductRepository({IAPIManager? apiManager})
    : _apiManager = apiManager ?? OpenFoodFactsAPIManager();
  final IAPIManager _apiManager;

  @override
  Future<Product> getProduct(String barcode) async {
    if (barcode.isEmpty) {
      throw ArgumentError('Barcode cannot be empty');
    }

    try {
      final ProductAPIEntity response = await _apiManager.loadProduct(barcode);

      if (response.response == null) {
        throw Exception('Product not found');
      }

      return response.response!.toProduct();
    } catch (e) {
      rethrow;
    }
  }
}
