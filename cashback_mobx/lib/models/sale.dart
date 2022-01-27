import 'package:cashback_mobx/models/cart_products.dart';
import 'package:cashback_mobx/models/customer.dart';

class Sale {
  String? idSale;
  Customer? customer;
  List<CartProducts>? cartProducts;
  DateTime? saleDate;
  double? totalValue;
  double? totalCashback;
  double? percentCashback;

  Sale({
    this.idSale,
    this.customer,
    this.cartProducts,
    this.saleDate,
    this.totalValue,
    this.totalCashback,
    this.percentCashback,
  });

  Sale copyWith({
    String? idSale,
    Customer? customer,
    List<CartProducts>? cartProducts,
    DateTime? saleDate,
    double? totalValue,
    double? totalCashback,
    double? percentCashback,
  }) {
    return Sale(
      idSale: idSale ?? this.idSale,
      customer: customer ?? this.customer,
      cartProducts: cartProducts ?? this.cartProducts,
      saleDate: saleDate ?? this.saleDate,
      totalValue: totalValue ?? this.totalValue,
      totalCashback: totalCashback ?? this.totalCashback,
      percentCashback: percentCashback ?? this.percentCashback,
    );
  }
}
