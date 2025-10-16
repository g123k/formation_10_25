// ignore_for_file: constant_identifier_names, unnecessary_string_escapes
class Product {
  Product({
    required this.barcode,
    this.name,
    this.altName,
    this.picture,
    this.quantity,
    this.brands,
    this.manufacturingCountries,
    this.nutriScore,
    this.nutriScoreLevels,
    this.novaScore,
    this.greenScore,
    this.ingredients,
    this.ingredientsWithAllergens,
    this.traces,
    this.allergens,
    this.additives,
    this.nutrientLevels,
    this.nutritionFacts,
    this.ingredientsFromPalmOil,
    this.containsPalmOil,
    this.isVegan,
    this.isVegetarian,
  });

  final String barcode;
  final String? name;
  final String? altName;
  final String? picture;
  final String? quantity;
  final List<String>? brands;
  final List<String>? manufacturingCountries;
  final ProductNutriScore? nutriScore;
  final ProductNutriScoreLevels? nutriScoreLevels;
  final ProductNovaScore? novaScore;
  final ProductGreenScore? greenScore;
  final List<String>? ingredients;

  // Eg: "Sucre, <span class=\"allergen\">gluten de blé</span>"
  final String? ingredientsWithAllergens;
  final List<String>? traces;
  final List<String>? allergens;
  final Map<String, String>? additives;
  final NutrientLevels? nutrientLevels;
  final NutritionFacts? nutritionFacts;
  final bool? ingredientsFromPalmOil;
  final ProductAnalysis? containsPalmOil;
  final ProductAnalysis? isVegan;
  final ProductAnalysis? isVegetarian;
}

class NutritionFacts {
  NutritionFacts({
    required this.servingSize,
    this.calories,
    this.fat,
    this.saturatedFat,
    this.carbohydrate,
    this.sugar,
    this.fiber,
    this.proteins,
    this.sodium,
    this.salt,
    this.energy,
  });

  final String servingSize;
  final Nutriment? calories;
  final Nutriment? fat;
  final Nutriment? saturatedFat;
  final Nutriment? carbohydrate;
  final Nutriment? sugar;
  final Nutriment? fiber;
  final Nutriment? proteins;
  final Nutriment? sodium;
  final Nutriment? salt;
  final Nutriment? energy;
}

class Nutriment {
  Nutriment({required this.unit, this.perServing, this.per100g});

  final String unit;
  final dynamic perServing;
  final dynamic per100g;
}

class NutrientLevels {
  NutrientLevels({this.salt, this.saturatedFat, this.sugars, this.fat});

  final String? salt;
  final String? saturatedFat;
  final String? sugars;
  final String? fat;
}

class ProductNutriScoreLevels {
  ProductNutriScoreLevels({
    required this.energy,
    required this.fiber,
    required this.fruitsVegetablesLegumes,
    required this.proteins,
    required this.salt,
    required this.saturatedFat,
    required this.sugars,
  });

  final ProductNutriScoreLevel? energy;
  final ProductNutriScoreLevel? fiber;
  final ProductNutriScoreLevel? fruitsVegetablesLegumes;
  final ProductNutriScoreLevel? proteins;
  final ProductNutriScoreLevel? salt;
  final ProductNutriScoreLevel? saturatedFat;
  final ProductNutriScoreLevel? sugars;
}

class ProductNutriScoreLevel {
  ProductNutriScoreLevel({
    required this.points,
    required this.maxPoints,
    required this.unit,
    required this.value,
    required this.type,
  });

  final double points;
  final double maxPoints;
  final String unit;
  final double value;
  final ProductNutriScoreLevelType type;
}

enum ProductNutriScoreLevelType { positive, negative, unknown }

enum ProductNutriScore { A, B, C, D, E, unknown }

enum ProductNovaScore { group1, group2, group3, group4, unknown }

enum ProductGreenScore { A, APlus, B, C, D, E, F, unknown }

enum ProductAnalysis {
  yes,
  no,
  maybe;

  static ProductAnalysis fromString(String? analysis) {
    return switch (analysis) {
      'yes' => ProductAnalysis.yes,
      'no' => ProductAnalysis.no,
      'maybe' => ProductAnalysis.maybe,
      _ => ProductAnalysis.maybe,
    };
  }
}

Product generateProduct() => Product(
  barcode: '1234567890',
  name: 'Nutella',
  altName: 'Product Alt Name',
  picture:
      'https://images.openfoodfacts.org/images/products/301/762/042/5035/front_fr.533.400.jpg',
  quantity: '200g',
  brands: <String>['Ferrero', 'Ferrero'],
  manufacturingCountries: <String>['France', 'Italie'],
  nutriScore: ProductNutriScore.E,
  novaScore: ProductNovaScore.group4,
  greenScore: ProductGreenScore.D,
  ingredients: <String>[
    'Sucre',
    'sirop de glucose',
    '_lait_ écrémé',
    'crème légère (_lait_)',
    'eau',
    'beurre de cacao',
    'matière grasse de noix de coco',
    '_lait_ écrémé concentré sucré',
    'pâte de cacao',
    'farine de _blé_',
    'matière grasse de palme',
    '_lait_ écrémé en poudre',
    '_lactose_',
    'matière grasse du _lait_',
    'huile de palmiste',
    'petit-_lait_ en poudre',
    'cacao maigre',
    'beurre (_lait_)',
    'émulsifiants (lécithine de _soja_, E471, tristéarate de sorbitane)',
    '_lait_ entier en poudre',
    'stabilisants (E407, E410, E412)',
    'arômes naturels (_lait_)',
    'sel',
    'colorant naturel (caramel ordinaire)',
    'cacao en poudre',
    'poudre à lever (E503)',
    'extrait naturel de vanille',
  ],
  ingredientsWithAllergens:
      'Sucre, sirop de glucose, <span class=\"allergen\">lait</span> écrémé, crème légère (<span class=\"allergen\">lait</span>), eau, beurre de cacao, matière grasse de noix de coco, <span class=\"allergen\">lait</span> écrémé concentré sucré, pâte de cacao, farine de <span class=\"allergen\">blé</span>, matière grasse de palme, <span class=\"allergen\">lait</span> écrémé en poudre, <span class=\"allergen\">lactose</span>, matière grasse du <span class=\"allergen\">lait</span>, huile de palmiste, petit-<span class=\"allergen\">lait</span> en poudre, cacao maigre, <span class=\"allergen\">beurre</span> (<span class=\"allergen\">lait</span>), émulsifiants (lécithine de <span class=\"allergen\">soja</span>, E471, tristéarate de sorbitane), <span class=\"allergen\">lait</span> entier en poudre, stabilisants (E407, E410, E412), arômes naturels (<span class=\"allergen\">lait</span>), sel, colorant naturel (caramel ordinaire), cacao en poudre, poudre à lever (E503), extrait naturel de vanille. (Peut contenir<span class=\"allergen\">: cacahuète</span>, <span class=\"allergen\">noisette</span>, <span class=\"allergen\">amande</span>).',
  traces: <String>['cacahuète', 'noisette', 'amande'],
  allergens: <String>['lait', 'soja', 'beurre'],
  additives: <String, String>{'e322i': 'Description', 'e471': 'Description'},
  nutriScoreLevels: ProductNutriScoreLevels(
    energy: ProductNutriScoreLevel(
      points: 3,
      maxPoints: 10,
      unit: 'kJ',
      value: 1180,
      type: ProductNutriScoreLevelType.negative,
    ),
    saturatedFat: ProductNutriScoreLevel(
      points: 9,
      maxPoints: 10,
      unit: 'g',
      value: 9.05,
      type: ProductNutriScoreLevelType.negative,
    ),
    sugars: ProductNutriScoreLevel(
      points: 7,
      maxPoints: 15,
      unit: 'g',
      value: 25.5,
      type: ProductNutriScoreLevelType.negative,
    ),
    proteins: ProductNutriScoreLevel(
      points: 1,
      maxPoints: 7,
      unit: 'g',
      value: 3.5,
      type: ProductNutriScoreLevelType.positive,
    ),
    fiber: ProductNutriScoreLevel(
      points: 0,
      maxPoints: 5,
      unit: 'g',
      value: 0,
      type: ProductNutriScoreLevelType.unknown,
    ),
    salt: ProductNutriScoreLevel(
      points: 1,
      maxPoints: 20,
      unit: 'g',
      value: 0,
      type: ProductNutriScoreLevelType.positive,
    ),
    fruitsVegetablesLegumes: ProductNutriScoreLevel(
      points: 0,
      maxPoints: 5,
      unit: '%',
      value: 0,
      type: ProductNutriScoreLevelType.positive,
    ),
  ),
  nutrientLevels: NutrientLevels(
    salt: 'Low',
    saturatedFat: 'Low',
    sugars: 'Low',
    fat: 'Low',
  ),
  nutritionFacts: NutritionFacts(
    servingSize: '100g',
    calories: Nutriment(unit: 'kcal', per100g: 100, perServing: 50),
    fat: Nutriment(unit: 'g', per100g: 10, perServing: 7),
    saturatedFat: Nutriment(unit: 'g', per100g: 5, perServing: 3),
    carbohydrate: Nutriment(unit: 'g', per100g: 20, perServing: 17),
    sugar: Nutriment(unit: 'g', per100g: 10, perServing: 5),
    fiber: Nutriment(unit: 'g', per100g: 5, perServing: 3),
    proteins: Nutriment(unit: 'g', per100g: 10, perServing: 7),
    sodium: Nutriment(unit: 'mg', per100g: 100, perServing: 50),
    salt: Nutriment(unit: 'g', per100g: 0.1, perServing: 0.05),
  ),
);
