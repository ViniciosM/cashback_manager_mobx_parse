// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomerStore on _CustomerStoreBase, Store {
  Computed<bool>? _$validNameComputed;

  @override
  bool get validName =>
      (_$validNameComputed ??= Computed<bool>(() => super.validName,
              name: '_CustomerStoreBase.validName'))
          .value;
  Computed<bool>? _$validPhoneComputed;

  @override
  bool get validPhone =>
      (_$validPhoneComputed ??= Computed<bool>(() => super.validPhone,
              name: '_CustomerStoreBase.validPhone'))
          .value;
  Computed<bool>? _$validEmailComputed;

  @override
  bool get validEmail =>
      (_$validEmailComputed ??= Computed<bool>(() => super.validEmail,
              name: '_CustomerStoreBase.validEmail'))
          .value;
  Computed<bool>? _$validCpfComputed;

  @override
  bool get validCpf =>
      (_$validCpfComputed ??= Computed<bool>(() => super.validCpf,
              name: '_CustomerStoreBase.validCpf'))
          .value;
  Computed<bool>? _$validFormComputed;

  @override
  bool get validForm =>
      (_$validFormComputed ??= Computed<bool>(() => super.validForm,
              name: '_CustomerStoreBase.validForm'))
          .value;
  Computed<dynamic Function()>? _$savePressedComputed;

  @override
  dynamic Function() get savePressed => (_$savePressedComputed ??=
          Computed<dynamic Function()>(() => super.savePressed,
              name: '_CustomerStoreBase.savePressed'))
      .value;
  Computed<dynamic Function()>? _$updatePressedComputed;

  @override
  dynamic Function() get updatePressed => (_$updatePressedComputed ??=
          Computed<dynamic Function()>(() => super.updatePressed,
              name: '_CustomerStoreBase.updatePressed'))
      .value;
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_CustomerStoreBase.showProgress'))
          .value;

  final _$customerAtom = Atom(name: '_CustomerStoreBase.customer');

  @override
  Customer? get customer {
    _$customerAtom.reportRead();
    return super.customer;
  }

  @override
  set customer(Customer? value) {
    _$customerAtom.reportWrite(value, super.customer, () {
      super.customer = value;
    });
  }

  final _$nameAtom = Atom(name: '_CustomerStoreBase.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$phoneAtom = Atom(name: '_CustomerStoreBase.phone');

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$emailAtom = Atom(name: '_CustomerStoreBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$cpfAtom = Atom(name: '_CustomerStoreBase.cpf');

  @override
  String? get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String? value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$noteAtom = Atom(name: '_CustomerStoreBase.note');

  @override
  String? get note {
    _$noteAtom.reportRead();
    return super.note;
  }

  @override
  set note(String? value) {
    _$noteAtom.reportWrite(value, super.note, () {
      super.note = value;
    });
  }

  final _$frequencyAtom = Atom(name: '_CustomerStoreBase.frequency');

  @override
  int? get frequency {
    _$frequencyAtom.reportRead();
    return super.frequency;
  }

  @override
  set frequency(int? value) {
    _$frequencyAtom.reportWrite(value, super.frequency, () {
      super.frequency = value;
    });
  }

  final _$cashbackBalanceAtom =
      Atom(name: '_CustomerStoreBase.cashbackBalance');

  @override
  double? get cashbackBalance {
    _$cashbackBalanceAtom.reportRead();
    return super.cashbackBalance;
  }

  @override
  set cashbackBalance(double? value) {
    _$cashbackBalanceAtom.reportWrite(value, super.cashbackBalance, () {
      super.cashbackBalance = value;
    });
  }

  final _$searchAtom = Atom(name: '_CustomerStoreBase.search');

  @override
  String? get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String? value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$filterByAtom = Atom(name: '_CustomerStoreBase.filterBy');

  @override
  String? get filterBy {
    _$filterByAtom.reportRead();
    return super.filterBy;
  }

  @override
  set filterBy(String? value) {
    _$filterByAtom.reportWrite(value, super.filterBy, () {
      super.filterBy = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CustomerStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_CustomerStoreBase.error');

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_createAsyncAction = AsyncAction('_CustomerStoreBase._create');

  @override
  Future<void> _create() {
    return _$_createAsyncAction.run(() => super._create());
  }

  final _$_updateAsyncAction = AsyncAction('_CustomerStoreBase._update');

  @override
  Future<void> _update() {
    return _$_updateAsyncAction.run(() => super._update());
  }

  final _$deleteAsyncAction = AsyncAction('_CustomerStoreBase.delete');

  @override
  Future<void> delete(Customer customer) {
    return _$deleteAsyncAction.run(() => super.delete(customer));
  }

  final _$_CustomerStoreBaseActionController =
      ActionController(name: '_CustomerStoreBase');

  @override
  void updateCustomerList(List<Customer> upCustomers) {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase.updateCustomerList');
    try {
      return super.updateCustomerList(upCustomers);
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNote(String value) {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase.setNote');
    try {
      return super.setNote(value);
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterBy(String value) {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase.setFilterBy');
    try {
      return super.setFilterBy(value);
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading() {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCustomer(Customer value) {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase.setCustomer');
    try {
      return super.setCustomer(value);
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFields() {
    final _$actionInfo = _$_CustomerStoreBaseActionController.startAction(
        name: '_CustomerStoreBase.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_CustomerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customer: ${customer},
name: ${name},
phone: ${phone},
email: ${email},
cpf: ${cpf},
note: ${note},
frequency: ${frequency},
cashbackBalance: ${cashbackBalance},
search: ${search},
filterBy: ${filterBy},
loading: ${loading},
error: ${error},
validName: ${validName},
validPhone: ${validPhone},
validEmail: ${validEmail},
validCpf: ${validCpf},
validForm: ${validForm},
savePressed: ${savePressed},
updatePressed: ${updatePressed},
showProgress: ${showProgress}
    ''';
  }
}
