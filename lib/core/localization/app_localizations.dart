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
      'authorization_code': 'Authorization code',
      'enter_the_code_sent_to_the_cell_phone': 'Enter the code sent to the cell phone: ',
      'processing': 'processing...',
      'wrong_code': '* Wrong code',
      'verifying': 'Verifying ...',
      'continue': 'Continue',
      'didn\'t_you_get_the_message': 'Didn\'t you get the message?',
      'resend': ' RESEND',
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
      'successful_order': 'Successful order',
      'delivery_address': 'Delivery address',
      'edit': 'Edit',
      'change': 'Change',
      'estimated_delivery': 'Estimated delivery',
      'payment_method': 'Payment method',
      'summary': 'Summary',
      'order': 'Order',
      'delivery': 'Delivery',
      'total': 'Total',
      'cash': 'Cash',
      'credit_card': 'Credit Card',
      'debit_card': 'Debit Card',
      'your_order': 'Your order',
      'comments': 'Comments',
      'my_address_title': 'Where do we send your order?',
      'city': 'City',
      'additional_address_info': 'Floor / Office / Flat',
    },
    'es': {
      'total': 'Total',
      'delivery': 'Domicilio',
      'order': 'Pedido',
      'summary': 'Resumen',
      'cash': 'Efectivo',
      'payment_method': 'Método de pago',
      'estimated_delivery': 'Entrega estimada',
      'change': 'Cambiar',
      'edit': 'Editar',
      'delivery_address': 'Dirección de entrega',
      'debit_card': 'Tarjeta de Débito',
      'credit_card': 'Tarjeta de Crédito',
      'successful_order': 'Orden exitosa',
      'see_order': 'Ver pedido',
      'authorization_code': 'Código de autorizacion',
      'enter_the_code_sent_to_the_cell_phone': 'Ingrese el código enviado al celular: ',
      'processing': 'Procesado...',
      'rong_code': '* Codigo erróneo',
      'verifying': 'Verificando ...',
      'continue': 'Continuar',
      'didn\'t_you_get_the_message': 'No resiviste el mensaje? ',
      'resend': ' REENVIAR',
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
      'your_order': 'Tu pedido',
      'comments': 'Comentarios',
      'my_address_title': 'A dónde quieres que llevemos tu pedido?',
      'city': 'Ciudad',
      'additional_address_info': 'Piso / Offinica / Apto',
    },
  };

  String get debitCard => _localizedValues[locale.languageCode]['debit_card'];

  String get creditCard => _localizedValues[locale.languageCode]['credit_card'];

  String get change => _localizedValues[locale.languageCode]['change'];

  String get cash => _localizedValues[locale.languageCode]['cash'];

  String get paymentMethod => _localizedValues[locale.languageCode]['payment_method'];

  String get total => _localizedValues[locale.languageCode]['total'];

  String get delivery => _localizedValues[locale.languageCode]['delivery'];

  String get order => _localizedValues[locale.languageCode]['order'];

  String get summary => _localizedValues[locale.languageCode]['summary'];

  String get estimatedDelivery => _localizedValues[locale.languageCode]['estimated_delivery'];

  String get edit => _localizedValues[locale.languageCode]['edit'];

  String get deliveryAddress => _localizedValues[locale.languageCode]['delivery_address'];

  String get successfulOrder => _localizedValues[locale.languageCode]['successful_order'];

  String get seeOrder => _localizedValues[locale.languageCode]['see_order'];

  String get yourOrderIsInProgress => _localizedValues[locale.languageCode]['Your_order_is_in_progress'];

  String get createAccount => _localizedValues[locale.languageCode]['create_account'];

  String get nameRequired => _localizedValues[locale.languageCode]['name_required'];

  String get name => _localizedValues[locale.languageCode]['name'];

  String get invalidEmail => _localizedValues[locale.languageCode]['invalid_email'];

  String get optionalField => _localizedValues[locale.languageCode]['optional_field'];

  String get email => _localizedValues[locale.languageCode]['email'];

  String get phoneRequired => _localizedValues[locale.languageCode]['phone_required'];

  String get phone => _localizedValues[locale.languageCode]['phone'];

  String get createAccountAction => _localizedValues[locale.languageCode]['create_account_action'];

  String get invalidPhone => _localizedValues[locale.languageCode]['invalid_phone'];

  String get addOrChooseAnAddress => _localizedValues[locale.languageCode]['add_or_choose_an_address'];

  String get searchYourAddress => _localizedValues[locale.languageCode]['search_your_address'];

  String get useMyLocation => _localizedValues[locale.languageCode]['use_my_location'];

  String get myAddresses => _localizedValues[locale.languageCode]['my_addresses'];

  String get authorizationCode => _localizedValues[locale.languageCode]['authorization_code'];

  String get enterTheCodeSentToTheCellPhone => _localizedValues[locale.languageCode]['enter_the_code_sent_to_the_cell_phone'];

  String get processing => _localizedValues[locale.languageCode]['processing'];

  String get wrongCode => _localizedValues[locale.languageCode]['wrong_code'];

  String get verifying => _localizedValues[locale.languageCode]['verifying'];

  String get continu => _localizedValues[locale.languageCode]['continue'];

  String get didntYouGetTheMessage => _localizedValues[locale.languageCode]['didn\'t_you_get_the_message'];

  String get resend => _localizedValues[locale.languageCode]['resend'];

  String get yourOrder => _localizedValues[locale.languageCode]['your_order'];

  String get comments => _localizedValues[locale.languageCode]['comments'];

  String get myAddressTitle => _localizedValues[locale.languageCode]['my_address_title'];

  String get city => _localizedValues[locale.languageCode]['city'];

  String get additionalAddressInfo => _localizedValues[locale.languageCode]['additional_address_info'];
}
