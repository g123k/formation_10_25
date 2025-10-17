import 'package:flutter/material.dart';
import 'package:off/l10n/app_localizations.dart';
import 'package:off/res/app_icons.dart';
import 'package:off/screens/homepage/homepage_list.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations!.my_scans_screen_title),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: Icon(AppIcons.barcode),
            ),
          ),
        ],
      ),
      body: HomepageList(),
    );
  }
}
