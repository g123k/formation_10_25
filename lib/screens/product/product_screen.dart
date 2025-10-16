import 'package:flutter/material.dart';
import 'package:off/model/product.dart';
import 'package:off/res/app_colors.dart';
import 'package:off/res/app_icons.dart';
import 'package:off/res/app_theme_extension.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  static const double containerRadius = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, BoxConstraints boxConstraints) {
          final double imageHeight = boxConstraints.maxHeight * 0.3;

          return Stack(
            children: <Widget>[
              PositionedDirectional(
                top: 0.0,
                start: 0.0,
                end: 0.0,
                height: imageHeight,
                child: Image.network(
                  'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=1310&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  fit: BoxFit.cover,
                  cacheHeight:
                      (imageHeight * MediaQuery.devicePixelRatioOf(context))
                          .toInt(),
                ),
              ),
              PositionedDirectional(
                top: imageHeight - containerRadius,
                start: 0.0,
                end: 0.0,
                bottom: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(containerRadius),
                    ),
                  ),
                  child: _Body(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  static const double _kHorizontalPadding = 20.0;
  static const double _kVerticalPadding = 30.0;

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: _kHorizontalPadding,
            end: _kHorizontalPadding,
            top: _kVerticalPadding,
            bottom: 10.0,
          ),
          child: _Header(),
        ),
        _Scores(),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Petits pois et carottes', style: context.theme.title1),
        const SizedBox(height: 3.0),
        Text('Cassegrain', style: context.theme.title2),
        const SizedBox(height: 8.0),
      ],
    );
  }
}

class _Scores extends StatelessWidget {
  const _Scores();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.grey1,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: _Body._kHorizontalPadding,
            ),
            child: IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 44,
                    child: _NutriScore(nutriscore: ProductNutriScore.A),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const VerticalDivider(),
                  ),
                  Expanded(
                    flex: 56,
                    child: _NOVAScore(novaScore: ProductNovaScore.group3),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: _Body._kHorizontalPadding,
              vertical: 10.0,
            ),
            child: _GreenScore(greenScore: ProductGreenScore.D),
          ),
        ],
      ),
    );
  }
}

class _NutriScore extends StatelessWidget {
  const _NutriScore({required this.nutriscore});

  final ProductNutriScore nutriscore;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Nutri-Score', style: context.theme.title3),
        const SizedBox(height: 5.0),
        Image.asset(_findAssetName(), height: 48.0),
      ],
    );
  }

  String _findAssetName() {
    return switch (nutriscore) {
      ProductNutriScore.A => 'res/drawables/nutriscore_a.png',
      ProductNutriScore.B => 'res/drawables/nutriscore_b.png',
      ProductNutriScore.C => 'res/drawables/nutriscore_c.png',
      ProductNutriScore.D => 'res/drawables/nutriscore_d.png',
      ProductNutriScore.E => 'res/drawables/nutriscore_e.png',
      ProductNutriScore.unknown => 'TODO',
    };
  }
}

class _NOVAScore extends StatelessWidget {
  const _NOVAScore({required this.novaScore});

  final ProductNovaScore novaScore;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Groupe NOVA', style: context.theme.title3),
        const SizedBox(height: 5.0),
        Text(_findLabel(), style: const TextStyle(color: AppColors.grey2)),
      ],
    );
  }

  String _findLabel() {
    return switch (novaScore) {
      ProductNovaScore.group1 =>
        'Aliments non transformés ou transformés minimalement',
      ProductNovaScore.group2 => 'Ingrédients culinaires transformés',
      ProductNovaScore.group3 => 'Aliments transformés',
      ProductNovaScore.group4 =>
        'Produits alimentaires et boissons ultra-transformés',
      ProductNovaScore.unknown => 'Score non calculé',
    };
  }
}

class _GreenScore extends StatelessWidget {
  const _GreenScore({required this.greenScore});

  final ProductGreenScore greenScore;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Green-Score', style: context.theme.title3),
        const SizedBox(height: 5.0),
        Row(
          children: <Widget>[
            Icon(_findIcon(), color: _findIconColor()),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                _findLabel(),
                style: const TextStyle(color: AppColors.grey2),
              ),
            ),
          ],
        ),
      ],
    );
  }

  IconData _findIcon() {
    return switch (greenScore) {
      ProductGreenScore.APlus => AppIcons.ecoscore_a_plus,
      ProductGreenScore.A => AppIcons.ecoscore_a,
      ProductGreenScore.B => AppIcons.ecoscore_b,
      ProductGreenScore.C => AppIcons.ecoscore_c,
      ProductGreenScore.D => AppIcons.ecoscore_d,
      ProductGreenScore.E => AppIcons.ecoscore_e,
      ProductGreenScore.F => AppIcons.ecoscore_f,
      // TODO
      ProductGreenScore.unknown => AppIcons.ecoscore_e,
    };
  }

  Color _findIconColor() {
    return switch (greenScore) {
      ProductGreenScore.APlus => AppColors.greenScoreAPlus,
      ProductGreenScore.A => AppColors.greenScoreA,
      ProductGreenScore.B => AppColors.greenScoreB,
      ProductGreenScore.C => AppColors.greenScoreC,
      ProductGreenScore.D => AppColors.greenScoreD,
      ProductGreenScore.E => AppColors.greenScoreE,
      ProductGreenScore.F => AppColors.greenScoreF,
      // TODO
      ProductGreenScore.unknown => Colors.transparent,
    };
  }

  String _findLabel() {
    return switch (greenScore) {
      ProductGreenScore.APlus => 'Très faible impact environnemental',
      ProductGreenScore.A => 'Très faible impact environnemental',
      ProductGreenScore.B => 'Faible impact environnemental',
      ProductGreenScore.C => "Impact modéré sur l'environnement",
      ProductGreenScore.D => 'Impact environnemental élevé',
      ProductGreenScore.E => 'Impact environnemental très élevé',
      ProductGreenScore.F => 'Impact environnemental très élevé',
      ProductGreenScore.unknown => 'Score non calculé',
    };
  }
}
