// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SaleStore on _SaleStoreBase, Store {
  Computed<bool>? _$validCustomerComputed;

  @override
  bool get validCustomer =>
      (_$validCustomerComputed ??= Computed<bool>(() => super.validCustomer,
              name: '_SaleStoreBase.validCustomer'))
          .value;
  Computed<bool>? _$validProductComputed;

  @override
  bool get validProduct =>
      (_$validProductComputed ??= Computed<bool>(() => super.validProduct,
              name: '_SaleStoreBase.validProduct'))
          .value;
  Computed<bool>? _$validFormComputed;

  @override
  bool get validForm =>
      (_$validFormComputed ??= Computed<bool>(() => super.validForm,
              name: '_SaleStoreBase.validForm'))
          .value;

  final _$customerAtom = Atom(name: '_SaleStoreBase.customer');

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

  final _$totalValueAtom = Atom(name: '_SaleStoreBase.totalValue');

  @override
  double? get totalValue {
    _$totalValueAtom.reportRead();
    return super.totalValue;
  }

  @override
  set totalValue(double? value) {
    _$totalValueAtom.reportWrite(value, super.totalValue, () {
      super.totalValue = value;
    });
  }

  final _$totalProductsAtom = Atom(name: '_SaleStoreBase.totalProducts');

  @override
  double get totalProducts {
    _$totalProductsAtom.reportRead();
    return super.totalProducts;
  }

  @override
  set totalProducts(double value) {
    _$totalProductsAtom.reportWrite(value, super.totalProducts, () {
      super.totalProducts = value;
    });
  }

  final _$totalCashbackAtom = Atom(name: '_SaleStoreBase.totalCashback');

  @override
  double? get totalCashback {
    _$totalCashbackAtom.reportRead();
    return super.totalCashback;
  }

  @override
  set totalCashback(double? value) {
    _$totalCashbackAtom.reportWrite(value, super.totalCashback, () {
      super.totalCashback = value;
    });
  }

  final _$percentCashbackAtom = Atom(name: '_SaleStoreBase.percentCashback');

  @override
  double? get percentCashback {
    _$percentCashbackAtom.reportRead();
    return super.percentCashback;
  }

  @override
  set percentCashback(double? value) {
    _$percentCashbackAtom.reportWrite(value, super.percentCashback, () {
      super.percentCashback = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SaleStoreBase.loading');

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

  final _$errorAtom = Atom(name: '_SaleStoreBase.error');

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

  final _$searchAtom = Atom(name: '_SaleStoreBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$filterByAtom = Atom(name: '_SaleStoreBase.filterBy');

  @override
  String get filterBy {
    _$filterByAtom.reportRead();
    return super.filterBy;
  }

  @override
  set filterBy(String value) {
    _$filterByAtom.reportWrite(value, super.filterBy, () {
      super.filterBy = value;
    });
  }

  final _$currentProductAtom = Atom(name: '_SaleStoreBase.currentProduct');

  @override
  Product? get currentProduct {
    _$currentProductAtom.reportRead();
    return super.currentProduct;
  }

  @override
  set currentProduct(Product? value) {
    _$currentProductAtom.reportWrite(value, super.currentProduct, () {
      super.currentProduct = value;
    });
  }

  final _$quantityAtom = Atom(name: '_SaleStoreBase.quantity');

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$_SaleStoreBaseActionController =
      ActionController(name: '_SaleStoreBase');

  @override
  void setCustomer(Customer value) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setCustomer');
    try {
      return super.setCustomer(value);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotalValue(double value) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setTotalValue');
    try {
      return super.setTotalValue(value);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotalCashback(double value) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setTotalCashback');
    try {
      return super.setTotalCashback(value);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotalProducts(double value) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setTotalProducts');
    try {
      return super.setTotalProducts(value);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPercentCashback(double value) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setPercentCashback');
    try {
      return super.setPercentCashback(value);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterBy(String value) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setFilterBy');
    try {
      return super.setFilterBy(value);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentProduct(Product value) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setCurrentProduct');
    try {
      return super.setCurrentProduct(value);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIncreaseQuantity() {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setIncreaseQuantity');
    try {
      return super.setIncreaseQuantity();
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDecreaseQuantity() {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setDecreaseQuantity');
    try {
      return super.setDecreaseQuantity();
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addProduct(Product p) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.addProduct');
    try {
      return super.addProduct(p);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteProduct(Product p) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.deleteProduct');
    try {
      return super.deleteProduct(p);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFields() {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customer: ${customer},
totalValue: ${totalValue},
totalProducts: ${totalProducts},
totalCashback: ${totalCashback},
percentCashback: ${percentCashback},
loading: ${loading},
error: ${error},
search: ${search},
filterBy: ${filterBy},
currentProduct: ${currentProduct},
quantity: ${quantity},
validCustomer: ${validCustomer},
validProduct: ${validProduct},
validForm: ${validForm}
    ''';
  }
}
