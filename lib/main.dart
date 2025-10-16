import 'package:flutter/material.dart';
import 'package:off/l10n/app_localizations.dart';
import 'package:off/res/app_colors.dart';
import 'package:off/res/app_theme_extension.dart';
import 'package:off/screens/product/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        fontFamily: 'Avenir',
        extensions: <ThemeExtension<dynamic>>[
          OffThemeExtension.defaultValues(),
        ],
        dividerTheme: DividerThemeData(color: AppColors.grey2, space: 1.0),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const ProductScreen(),
    );
  }
}
