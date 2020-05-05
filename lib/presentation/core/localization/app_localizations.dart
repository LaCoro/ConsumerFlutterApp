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
      'Your_order_is_in_progress': 'Your order is in progress',
      'create_account': 'Create your account to complete the order',
      'name_required': 'Please enter a name',
      'name': 'Name',
      'invalid_email': 'Please enter a valid email',
      'optional_field': '(Optional)',
      'email': 'Email',
      'phone_required': 'Please enter a phone',
      'phone': 'Phone',
      'create_account_action': 'Create account',
      'invalid_phone': 'Please enter a valid phone number',
      'add_or_choose_an_address': 'Add or choose and address',
      'search_your_address': 'Search you address',
      'use_my_location': 'Use my current location',
      'my_addresses': 'My addresses',
      'successful_order': 'Successful order'
    },
    'es': {
      'successful_order': 'Orden exitosa',
      'see_order': 'Ver pedido',
      'Your_order_is_in_progress': 'Tu pedido está en curso',
      'create_account': 'Crea tu cuenta para completar el pedido',
      'name_required': 'Por favor ingrese un nombre',
      'name': 'Nombre',
      'invalid_email': 'Por favor ingrese un correo electrónico válido',
      'optional_field': '(Opcional)',
      'email': 'Correo electrónico',
      'phone_required': 'Por favor ingrese un teléfono',
      'phone': 'Teléfono',
      'create_account_action': 'Crear cuenta',
      'invalid_phone': 'Por favor ingrese un teléfono válido',
      'add_or_choose_an_address': 'Agrega o escoge una dirección',
      'search_your_address': 'Buscar tu dirección',
      'use_my_location': 'Usar mi ubicación actual',
      'my_addresses': 'Mis direcciones',
    },
  };

  String get successfulOrder {
    return _localizedValues[locale.languageCode]['successful_order'];
  }

  String get seeOrder {
    return _localizedValues[locale.languageCode]['see_order'];
  }

  String get yourOrderIsInProgress {
    return _localizedValues[locale.languageCode]['Your_order_is_in_progress'];
  }

  String get createAccount {
    return _localizedValues[locale.languageCode]['create_account'];
  }

  String get nameRequired {
    return _localizedValues[locale.languageCode]['name_required'];
  }

  String get name {
    return _localizedValues[locale.languageCode]['name'];
  }

  String get invalidEmail {
    return _localizedValues[locale.languageCode]['invalid_email'];
  }

  String get optionalField {
    return _localizedValues[locale.languageCode]['optional_field'];
  }

  String get email {
    return _localizedValues[locale.languageCode]['email'];
  }

  String get phoneRequired {
    return _localizedValues[locale.languageCode]['phone_required'];
  }

  String get phone {
    return _localizedValues[locale.languageCode]['phone'];
  }

  String get createAccountAction {
    return _localizedValues[locale.languageCode]['create_account_action'];
  }

  String get invalidPhone {
    return _localizedValues[locale.languageCode]['invalid_phone'];
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
