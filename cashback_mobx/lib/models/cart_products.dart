import 'package:cashback_mobx/models/product.dart';

class CartProducts {
  Product? product;
  int? quantity;
  double? totalValueProducts;
  CartProducts({this.product, this.quantity, this.totalValueProducts});
}
