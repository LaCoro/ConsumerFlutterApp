
enum PaymentType { cash, credit, debit }

String getPaymentName(PaymentType paymentType) {
  switch (paymentType) {
    case PaymentType.cash:
      return "Efectivo";
    case PaymentType.credit:
      return "Tarjeta de Crédito";
    case PaymentType.debit:
      return "Tarjeta de Débito";
  }
  return "";
}