import 'package:cashback_mobx/models/cart_products.dart';
import 'package:cashback_mobx/models/customer.dart';
import 'package:cashback_mobx/models/product.dart';
import 'package:mobx/mobx.dart';
part 'sale_store.g.dart';

class SaleStore = _SaleStoreBase with _$SaleStore;

abstract class _SaleStoreBase with Store {
 
  /*
  _SaleStoreBase() {
    autorun((_) async {
      loading = true;

      if (customer != null) {
        nameController.text = customer!.name!;
        phoneController.text = customer!.phone!;
        emailController.text = customer!.email ?? '';
        cpfController.text = customer!.cpf ?? '';
        noteController.text = customer!.note ?? '';

        name = nameController.text;
        phone = phoneController.text;
        email = emailController.text;
        cpf = cpfController.text;
        note = noteController.text;
        frequency = customer!.frequency;
        cashbackBalance = customer!.cashbackBalance;
      }

      try {
        var readCustomerList =
            await CustomerRepository().read(search!, filterBy!);

        updateCustomerList(readCustomerList);
        //updateNameProductList(readProductList);
        loading = false;
      } catch (e) {
        error = e.toString();
      }
    });
  }
  */

  @observable
  Customer? customer;

  ObservableList<CartProducts>? listProducts = ObservableList();

  //ObservableList<CartProducts>? listProducts = ObservableList();

  @observable
  double? totalValue;

  @observable
  double totalProducts = 0;

  @observable
  double? totalCashback;

  @observable
  double? percentCashback;

  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  String search = '';

  @observable
  String filterBy = 'Filtrar por';

  @observable
  Product? currentProduct;

  @observable
  int quantity = 1;

  /*
  @action
  void updateSaleList(List<Sale> upSales) {
    if (saleList.isNotEmpty) {
      saleList.clear();
    }
    saleList.addAll(upSales);
  }
  */

  @action
  void setCustomer(Customer value) => customer = value;

  @action
  void setTotalValue(double value) => totalValue = value;

  @action
  void setTotalCashback(double value) => totalCashback = value;

  @action
  void setTotalProducts(double value) => totalProducts = value;

  @action
  void setPercentCashback(double value) => percentCashback = value;

  @action
  void setError(String value) => error = value;

  @action
  void setSearch(String value) => search = value;

  @action
  void setFilterBy(String value) => filterBy = value;

  @action
  void setLoading(bool value) => loading = value;

  @action
  void setCurrentProduct(Product value) => currentProduct = value;

  @action
  void setIncreaseQuantity() => quantity += 1;

  @action
  void setDecreaseQuantity() => quantity -= 1;

  /*
  @action
  void sumPriceProducts() {
    if (listProducts != null) {
      for (Product p in listProducts!) {
        totalProducts += p.price!;
      }
    }
  }
  */

  @action
  void addProduct(Product p) {
    //listProducts!.add(p);
  }

  @action
  deleteProduct(Product p) {
    //listProducts!.removeWhere((element) => p.idProduct == element.idProduct);
  }

  @action
  void clearFields() {
    customer = null;
    listProducts = null;
    totalValue = null;
    totalCashback = null;
    percentCashback = null;
  }

  /*
  @computed
  bool get showProgress => loading && saleList.isEmpty;
  */

  @computed
  bool get validCustomer => customer != null;
  String? get customerError =>
      customer == null || validCustomer ? null : 'Cliente inválido';

  @computed
  bool get validProduct => listProducts != null;
  String? get productError =>
      listProducts == null || validProduct ? null : 'Produto inválido';

  @computed
  bool get validForm => validCustomer && validProduct;


  /*
  @computed
  Function() get savePressed => _create;

  @computed
  Function() get updatePressed => _update;

   @action
  Future<void> _create() async {
    loading = true;
    error = null;
 
    try {
      if (validForm) {
        Customer c = Customer(
          name: name,
          email: email,
          phone: phone,
          cpf: cpf,
          note: note,
          frequency: 0,
          cashbackBalance: 0.0,
        );
        await CustomerRepository().create(c);
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

    customer!.name = name;
    customer!.phone = phone;
    customer!.email = email;
    customer!.cpf = cpf;
    customer!.note = note;
    customer!.frequency = frequency;
    customer!.cashbackBalance = cashbackBalance;

    try {
      if (validForm) {
        await CustomerRepository().update(customer!);
        clearFields();
      }
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  @action
  Future<void> delete(Customer customer) async {
    loading = true;
    error = null;

    try {
      await CustomerRepository().delete(customer);
      customerList
          .removeWhere((element) => element.idCustomer == customer.idCustomer);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }

  */
}
