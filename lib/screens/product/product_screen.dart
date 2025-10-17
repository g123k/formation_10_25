import 'package:flutter/material.dart';
import 'package:off/l10n/app_localizations.dart';
import 'package:off/model/product.dart';
import 'package:off/res/app_icons.dart';
import 'package:off/screens/product/product_header.dart';
import 'package:off/screens/product/product_provider.dart';
import 'package:off/screens/product/tabs/product_tab0.dart';
import 'package:off/screens/product/tabs/product_tab1.dart';
import 'package:off/screens/product/tabs/product_tab2.dart';
import 'package:off/screens/product/tabs/product_tab3.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProductDetailsCurrentTab _tab;

  @override
  void initState() {
    super.initState();
    _tab = ProductDetailsCurrentTab.summary;
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tab.index,
          onTap: (int position) =>
              setState(() => _tab = ProductDetailsCurrentTab.values[position]),
          items: ProductDetailsCurrentTab.values
              .map(
                (ProductDetailsCurrentTab tab) => BottomNavigationBarItem(
                  icon: Icon(tab.icon),
                  label: tab.label(localizations),
                ),
              )
              .toList(growable: false),
        ),
      ),
    );
  }

  Widget _getBody() {
    return switch (_tab) {
      ProductDetailsCurrentTab.summary => ProductTab0(),
      ProductDetailsCurrentTab.info => ProductTab1(),
      ProductDetailsCurrentTab.nutrition => ProductTab2(),
      ProductDetailsCurrentTab.nutritionalValues => ProductTab3(),
    };
  }
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
