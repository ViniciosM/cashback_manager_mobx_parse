import 'package:cashback_mobx/models/customer.dart';
import 'package:cashback_mobx/repositories/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'customer_store.g.dart';

class CustomerStore = _CustomerStoreBase with _$CustomerStore;

abstract class _CustomerStoreBase with Store {
  _CustomerStoreBase() {
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

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController cpfController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  ObservableList<Customer> customerList = ObservableList<Customer>();

  @observable
  Customer? customer;

  @observable
  String? name;

  @observable
  String? phone;

  @observable
  String? email;

  @observable
  String? cpf;

  @observable
  String? note;

  @observable
  int? frequency;

  @observable
  double? cashbackBalance;

  @observable
  String? search = '';

  @observable
  String? filterBy = 'Filtrar por';

  @observable
  bool loading = false;

  @observable
  String? error;

  @action
  void updateCustomerList(List<Customer> upCustomers) {
    if (customerList.isNotEmpty) {
      customerList.clear();
    }
    customerList.addAll(upCustomers);
  }

  @action
  void setName(String value) => name = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setCpf(String value) => cpf = value;

  @action
  void setNote(String value) => note = value;

  @action
  void setFilterBy(String value) => filterBy = value;

  @action
  void setSearch(String value) => search = value;

  @action
  void setLoading() => loading = !loading;

  @action
  void setError(String value) => error = value;

  @action
  void setCustomer(Customer value) => customer = value;

  @action
  void clearFields() {
    nameController.text = '';
    phoneController.text = '';
    emailController.text = '';
    cpfController.text = '';
    noteController.text = '';

    name = null;
    phone = null;
    email = null;
    cpf = null;
    note = null;
    customer = null;
  }

  @computed
  bool get validName => name != null && name!.length >= 3;
  String? get nameError =>
      name == null || validName ? null : 'Nome inválido';

  @computed
  bool get validPhone => phone != null && phone!.length == 14;
  String? get phoneError =>
      phone == null || validPhone ? null : 'Telefone inválido';

  @computed
  bool get validEmail => email != null;
  String? get emailError =>
      email == null || validEmail ? null : 'Email inválido';

  @computed
  bool get validCpf => cpf != null;
  String? get cpfError => cpf == null || validCpf ? null : 'CPF inválido';

  @computed
  bool get validForm => validName && validPhone;

  @computed
  Function() get savePressed => _create;

  @computed
  Function() get updatePressed => _update;

  @computed
  bool get showProgress => loading && customerList.isEmpty;

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
}
