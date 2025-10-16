// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get my_scans_screen_title => 'Mes scans';

  @override
  String get my_scans_screen_description =>
      'Vous n\'avez pas encore scanné de produit';

  @override
  String get my_scans_screen_button => 'Commencer';
}
