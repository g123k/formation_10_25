import 'package:flutter/material.dart';
import 'package:off/l10n/app_localizations.dart';
import 'package:off/model/product.dart';
import 'package:off/res/app_icons.dart';
import 'package:off/screens/homepage/homepage_empty.dart';
import 'package:off/screens/homepage/homepage_list.dart';
import 'package:off/screens/homepage/homepage_notifier.dart';
import 'package:off/screens/product/product_screen.dart';
import 'package:provider/provider.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localizations = AppLocalizations.of(context);

    return ChangeNotifierProvider<HomepageNotifier>(
      create: (_) => HomepageNotifier(),
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(localizations!.my_scans_screen_title),
              centerTitle: false,
              actions: <Widget>[
                IconButton(
                  onPressed: () => _onScanButtonPressed(context),
                  icon: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8.0),
                    child: Icon(AppIcons.barcode),
                  ),
                ),
              ],
            ),
            body: Consumer<HomepageNotifier>(
              builder: (BuildContext context, HomepageNotifier notifier, _) {
                if (!notifier.hasScans) {
                  return HomepageEmpty(
                    onScan: () => _onScanButtonPressed(context),
                  );
                } else {
                  return const HomepageList();
                }
              },
            ),
          );
        },
      ),
    );
  }

  void _onScanButtonPressed(BuildContext context) {
    final Product product = generateProduct();
    context.read<HomepageNotifier>().addToHistory(product);

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return ProductScreen();
        },
      ),
    );
  }
}
