import 'package:intl/intl.dart';

extension NumberExtension on num {
  currencyFormat({int decimalDigits = 0}) {
    return NumberFormat.simpleCurrency(decimalDigits: decimalDigits).format(this);
  }
}
