import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'see_order': 'See order',
    },
    'es': {
      'see_order': 'Ver pedido',
    },
  };

  String get seeOrder {
    return _localizedValues[locale.languageCode]['see_order'];
  }
}
