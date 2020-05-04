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
      "enter_the_code_sent_to_the_cell_phone":
          "Enter the code sent to the cell phone: ",
      "processing": "processing...",
      "wrong_code": "* Wrong code",
      "verifying": "Verifying ...",
      "continue": "Continue",
      "didn't_you_get_the_message" : "Didn't you get the message?",
      "resend":" RESEND",


    },
    'es': {
      'see_order': 'Ver pedido',
      'authorization_code': 'Código de autorizacion',
      "enter_the_code_sent_to_the_cell_phone":
          "Ingrese el código enviado al celular: ",
      "processing": "Procesado...",
      "rong_code": "* Codigo erróneo",
      "verifying": "Verificando ...",
      "continue": "Continuar",
      "didn't_you_get_the_message" : "No resiviste el mensaje? ",
      "resend":" REENVIAR",
    },
  };

  String get seeOrder {
    return _localizedValues[locale.languageCode]['see_order'];
  }

  String get authorizationCode {
    return _localizedValues[locale.languageCode]['authorization_code'];
  }

  String get enterTheCodeSentToTheCellPhone {
    return _localizedValues[locale.languageCode]
        ["enter_the_code_sent_to_the_cell_phone"];
  }

  String get processing {
    return _localizedValues[locale.languageCode]["processing"];
  }

  String get wrongCode {
    return _localizedValues[locale.languageCode]["wrong_code"];
  }

  String get verifying {
    return _localizedValues[locale.languageCode]['verifying'];
  }
  String get continu {
    return _localizedValues[locale.languageCode]['continue'];
  }
  String get didntYouGetTheMessage {
    return _localizedValues[locale.languageCode]["didn't_you_get_the_message"];
  }
  String get resend {
    return _localizedValues[locale.languageCode]["resend"];
  }
}
