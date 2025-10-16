import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:off/l10n/app_localizations.dart';
import 'package:off/res/app_colors.dart';
import 'package:off/res/app_icons.dart';
import 'package:off/res/app_vectorial_images.dart';

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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 20),
            SvgPicture.asset(AppVectorialImages.illEmpty),
            Spacer(flex: 10),
            Expanded(
              flex: 20,
              child: Column(
                children: <Widget>[
                  Text(
                    localizations.my_scans_screen_description,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(flex: 5),
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: TextButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.blue,
                        backgroundColor: AppColors.yellow,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(22.0)),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              localizations.my_scans_screen_button
                                  .toUpperCase(),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Icon(Icons.arrow_forward_outlined),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 20),
          ],
        ),
      ),
    );
  }
}
