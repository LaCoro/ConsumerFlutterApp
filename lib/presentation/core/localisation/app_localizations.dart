import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'all_category' : 'all',
      'see_order': 'See order',
      'Your_order_is_in_progress' : 'Your order is in progress'
    },
    'es': {
      'all_category': 'Todos',
      'see_order': 'Ver pedido',
      'Your_order_is_in_progress' : 'Tu pedido está en curso',
    },
  };

  String get allCategory => _localizedValues[locale.languageCode]['all_category'];

  String get seeOrder {
    return _localizedValues[locale.languageCode]['see_order'];
  }
  String get yourOrderIsInProgress {
    return _localizedValues[locale.languageCode]['Your_order_is_in_progress'];
  }


}
