import 'package:flutter/material.dart';
import 'package:off/l10n/app_localizations.dart';
import 'package:off/model/product.dart';
import 'package:off/res/app_icons.dart';
import 'package:off/screens/product/product_header.dart';
import 'package:off/screens/product/product_provider.dart';
import 'package:off/screens/product/tabs/product_tab0.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = generateProduct();

    return ProductProvider(
      product: product,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            ProductHeader(),
            SliverPadding(
              padding: EdgeInsetsDirectional.only(top: 10.0),
              sliver: SliverFillRemaining(
                fillOverscroll: true,
                hasScrollBody: false,
                child: _getBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBody() => ProductTab0();
}

enum ProductDetailsCurrentTab {
  summary(AppIcons.tab_barcode),
  info(AppIcons.tab_fridge),
  nutrition(AppIcons.tab_nutrition),
  nutritionalValues(AppIcons.tab_array);

  const ProductDetailsCurrentTab(this.icon);

  final IconData icon;

  String label(AppLocalizations appLocalizations) => switch (this) {
    ProductDetailsCurrentTab.summary => appLocalizations.product_tab_summary,
    ProductDetailsCurrentTab.info => appLocalizations.product_tab_properties,
    ProductDetailsCurrentTab.nutrition =>
      appLocalizations.product_tab_nutrition,
    ProductDetailsCurrentTab.nutritionalValues =>
      appLocalizations.product_tab_nutrition_facts,
  };
}
