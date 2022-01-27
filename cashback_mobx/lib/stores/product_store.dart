import 'package:cashback_mobx/models/product.dart';
import 'package:cashback_mobx/repositories/product_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  _ProductStoreBase() {
    autorun((_) async {
      loading = true;

      if (product != null) {
        descriptionController.text = product!.description!;
        //priceController.text = product!.price!.toString();
        cashbackController.text = product!.cashback!.toString();
        priceController.text = product!.showPrice!;
        description = descriptionController.text;
        price = priceController.text;
        cashback = cashbackController.text;
      }

      try {
        var readProductList =
            await ProductRepository().read(search!, filterBy!);

        updateProductList(readProductList);
        //updateNameProductList(readProductList);
        loading = false;
      } catch (e) {
        error = e.toString();
      }
    });
  }

  TextEditingController descriptionController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController cashbackController = TextEditingController();

  ObservableList<Product> productList = ObservableList<Product>();

  @observable
  Product? product;

  @observable
  String? description;

  @observable
  String? price;

  @observable
  String? cashback;

  @observable
  String? search = '';

  @observable
  String? filterBy = 'Filtrar por';

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  void updateProductList(List<Product> upProducts) {
    if (productList.isNotEmpty) {
      productList.clear();
    }
    productList.addAll(upProducts);
  }

  @action
  void setProduct(Product value) => product = value;

  @action
  void setDescription(String value) => description = value;

  @action
  void setPrice(String value) => price = value;

  @action
  void setCashback(String value) => cashback = value;

  @action
  void setLoading() => loading = !loading;

  @action
  void setSearch(String value) => search = value;

  @action
  void setFilterBy(String value) => filterBy = value;

  @action
  void setError(String value) => error = value;

  @action
  clearFields() {
    descriptionController.text = '';
    priceController.text = '';
    cashbackController.text = '';

    description = null;
    price = null;
    cashback = null;
    product = null;
  }

  @computed
  int get itemCount => productList.length;

  @computed
  bool get showProgress => loading && productList.isEmpty;

  @computed
  bool get validDescription => description != null && description!.length >= 5;
  String? get descriptionError =>
      description == null || validDescription ? null : 'Descrição inválida';

  @computed
  bool get validPrice => price != null;
  String? get priceError =>
      price == null || validPrice ? null : 'Preço inválido';

  @computed
  bool get validCashback => cashback != null;
  String? get cashbackError =>
      cashback == null || validCashback ? null : 'Cashback inválido';

  @computed
  bool get validForm => validDescription && validPrice && validCashback;

  @computed
  Function() get savePressed => validForm ? _create : _failedCreate;

  Function() get updatePressed => _update;

  @action
  Future<void> _create() async {
    loading = true;
    error = null;
    //Salvar preço no formato BR
    String showPrice = price!;
    print(showPrice);
    //Salvar preço no BD (sem vírgula)
    String priceDoubleF = price!.replaceAll(',', '.');
    double priceF = double.parse(priceDoubleF);

    double cashbackF = double.parse(cashback!);
    try {
      if (validForm) {
        Product p = Product(
            description: description,
            price: priceF,
            showPrice: showPrice,
            cashback: cashbackF,
            totalSales: 0);
        await ProductRepository().create(p);
        clearFields();
      }
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> _update() async {
    loading = true;
    error = null;

    String priceDoubleF = price!.replaceAll(',', '.');
    double priceF = double.parse(priceDoubleF);
    
    double cashbackF = double.parse(cashback!);

    product!.showPrice = priceController.text;
    product!.description = description;
    product!.price = priceF;
    product!.cashback = cashbackF;

    try {
      if (validForm) {
        await ProductRepository().update(product!);
      }
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> delete(Product product) async {
    loading = true;
    error = null;

    try {
      await ProductRepository().delete(product);
      productList
          .removeWhere((element) => element.idProduct == product.idProduct);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> _failedCreate() async {
    loading = true;
    loading = false;
  }
}
