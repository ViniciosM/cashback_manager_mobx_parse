import 'package:cashback_mobx/models/sale.dart';

class Cashback {
  /*
    status = 0 -> Pendente
    status = 1 -> Pago
  */

  final Sale sale;
  final int status;

  Cashback({
    required this.sale,
    required this.status,
  });

  @override
  String toString() => 'Cashback(sale: $sale, status: $status)';
}
