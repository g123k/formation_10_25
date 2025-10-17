import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:off/demo.dart';
import 'package:off/l10n/app_localizations.dart';
import 'package:off/res/app_colors.dart';
import 'package:off/res/app_theme_extension.dart';
import 'package:off/screens/product/product_screen.dart';

void main() {
  runApp(const MyApp());
}

GoRouter _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (_, _) => const MyDemo(),
      routes: <GoRoute>[
        GoRoute(
          path: 'product',
          builder: (_, GoRouterState state) => const ProductScreen(),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.grey2,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
        ),
        navigationBarTheme: const NavigationBarThemeData(
          indicatorColor: AppColors.blue,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
