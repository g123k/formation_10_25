// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'api/openfoodfacts_api.dart' as _i409;
import 'repositories/product_repository.dart' as _i106;
import 'screens/product/product_provider.dart' as _i402;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i409.IAPIManager>(() => _i409.OpenFoodFactsAPIManager());
    gh.factoryParam<_i402.ProductNotifier, String, dynamic>(
      (barcode, _) => _i402.ProductNotifier(
        barcode: barcode,
        repository: gh<_i106.IProductRepository>(),
      ),
    );
    gh.singleton<_i106.IProductRepository>(
      () => _i106.ProductRepository(apiManager: gh<_i409.IAPIManager>()),
    );
    return this;
  }
}
