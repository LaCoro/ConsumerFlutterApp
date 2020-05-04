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
      'Your_order_is_in_progress' : 'Your order is in progress',
          "successful_order" : "Successful order"
    },
    'es': {
      'see_order': 'Ver pedido',
      'Your_order_is_in_progress' : 'Tu pedido está en curso',
      "successful_order" : "Orden exitosa",
    },
  };

  String get seeOrder {
    return _localizedValues[locale.languageCode]['see_order'];
  }
  String get yourOrderIsInProgress {
    return _localizedValues[locale.languageCode]['Your_order_is_in_progress'];
  }
  String get successfullOrder {
    return _localizedValues[locale.languageCode]['successful_order'];
  }
}
