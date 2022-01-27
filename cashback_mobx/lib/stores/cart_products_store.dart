
import 'package:cashback_mobx/models/product.dart';
import 'package:mobx/mobx.dart';
part 'cart_products_store.g.dart';

class CartProductsStore = _CartProductsStoreBase with _$CartProductsStore;

abstract class _CartProductsStoreBase with Store {
  @observable
  Product? product;

  @observable
  int? quantity;

  @observable
  double? totalValueProducts;

  @action
  void setProduct(Product value) => product = value;

  @action
  void setQuantity(int value) => quantity = value;

  @action
  void setTotalValueProducts(double value) => totalValueProducts = value;

  
  
}