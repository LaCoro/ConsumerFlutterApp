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
      'add_or_choose_an_address' : 'Add or choose and address',
      'search_your_address' : 'Search you address',
      'use_my_location' : 'Use my current location',
      'my_addresses' : 'My addresses',
    },
    'es': {
      'see_order': 'Ver pedido',
      'Your_order_is_in_progress' : 'Tu pedido está en curso',
      'add_or_choose_an_address' : 'Agrega o escoge una dirección',
      'search_your_address' : 'Buscar tu dirección',
      'use_my_location' : 'Usar mi ubicación actual',
      'my_addresses' : 'Mis direcciones',
    },
  };

  String get seeOrder {
    return _localizedValues[locale.languageCode]['see_order'];
  }
  String get yourOrderIsInProgress {
    return _localizedValues[locale.languageCode]['Your_order_is_in_progress'];
  }
  String get addOrChooseAnAddress {
    return _localizedValues[locale.languageCode]['add_or_choose_an_address'];
  }
  String get searchYourAddress {
    return _localizedValues[locale.languageCode]['search_your_address'];
  }
  String get useMyLocation {
    return _localizedValues[locale.languageCode]['use_my_location'];
  }
  String get myAddresses {
    return _localizedValues[locale.languageCode]['my_addresses'];
  }
}
