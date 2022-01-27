
import 'package:cashback_mobx/constants/keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Product {
  Product(
      {required this.description,
      required this.price,
      required this.showPrice,
      required this.cashback,
      required this.totalSales});

  String? idProduct;
  String? description;
  double? price;
  int qtd = 1;
  String? showPrice;
  double? cashback;
  int? totalSales;
  bool selected = false;

  Product.fromParse(ParseObject object) {
    idProduct = object.objectId;
    description = object.get<String>(keyDescriptionProduct);
    price = object.get<double>(keyPriceProduct);
    showPrice = object.get<String>(keyShowPriceProduct);
    cashback = object.get<double>(keyCashbackProduct);
    totalSales = object.get<int>(keyTotalSalesProduct);

    //created = object.createdAt;
  }

  @override
  String toString() {
    return 'Product{idProduct: $idProduct, description: $description, price: $price, cashback: $cashback, totalSales: $totalSales}';
  }
}
