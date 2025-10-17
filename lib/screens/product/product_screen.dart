import 'package:flutter/material.dart';
import 'package:off/l10n/app_localizations.dart';
import 'package:off/main.dart';
import 'package:off/res/app_icons.dart';
import 'package:off/screens/product/product_header.dart';
import 'package:off/screens/product/product_provider.dart';
import 'package:off/screens/product/tabs/product_tab0.dart';
import 'package:off/screens/product/tabs/product_tab1.dart';
import 'package:off/screens/product/tabs/product_tab2.dart';
import 'package:off/screens/product/tabs/product_tab3.dart';
import 'package:provider/provider.dart';

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

    return ChangeNotifierProvider<ProductNotifier>(
      create: (_) => getIt<ProductNotifier>(param1: '5000159484695'),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<ProductNotifier>(
          builder: (BuildContext context, ProductNotifier notifier, _) {
            if (notifier.product == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: CustomScrollView(
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
                  BottomNavigationBar(
                    currentIndex: _tab.index,
                    onTap: (int position) => setState(
                      () => _tab = ProductDetailsCurrentTab.values[position],
                    ),
                    items: ProductDetailsCurrentTab.values
                        .map(
                          (ProductDetailsCurrentTab tab) =>
                              BottomNavigationBarItem(
                                icon: Icon(tab.icon),
                                label: tab.label(localizations),
                              ),
                        )
                        .toList(growable: false),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _getBody() {
    return Stack(
      children: <Widget>[
        Offstage(
          offstage: _tab != ProductDetailsCurrentTab.summary,
          child: ProductTab0(),
        ),
        Offstage(
          offstage: _tab != ProductDetailsCurrentTab.info,
          child: ProductTab1(),
        ),
        Offstage(
          offstage: _tab != ProductDetailsCurrentTab.nutrition,
          child: ProductTab2(),
        ),
        Offstage(
          offstage: _tab != ProductDetailsCurrentTab.nutritionalValues,
          child: ProductTab3(),
        ),
      ],
    );
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
