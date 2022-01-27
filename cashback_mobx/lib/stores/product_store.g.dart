// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStoreBase, Store {
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount =>
      (_$itemCountComputed ??= Computed<int>(() => super.itemCount,
              name: '_ProductStoreBase.itemCount'))
          .value;
  Computed<bool>? _$showProgressComputed;

  @override
  bool get showProgress =>
      (_$showProgressComputed ??= Computed<bool>(() => super.showProgress,
              name: '_ProductStoreBase.showProgress'))
          .value;
  Computed<bool>? _$validDescriptionComputed;

  @override
  bool get validDescription => (_$validDescriptionComputed ??= Computed<bool>(
          () => super.validDescription,
          name: '_ProductStoreBase.validDescription'))
      .value;
  Computed<bool>? _$validPriceComputed;

  @override
  bool get validPrice =>
      (_$validPriceComputed ??= Computed<bool>(() => super.validPrice,
              name: '_ProductStoreBase.validPrice'))
          .value;
  Computed<bool>? _$validCashbackComputed;

  @override
  bool get validCashback =>
      (_$validCashbackComputed ??= Computed<bool>(() => super.validCashback,
              name: '_ProductStoreBase.validCashback'))
          .value;
  Computed<bool>? _$validFormComputed;

  @override
  bool get validForm =>
      (_$validFormComputed ??= Computed<bool>(() => super.validForm,
              name: '_ProductStoreBase.validForm'))
          .value;
  Computed<dynamic Function()>? _$savePressedComputed;

  @override
  dynamic Function() get savePressed => (_$savePressedComputed ??=
          Computed<dynamic Function()>(() => super.savePressed,
              name: '_ProductStoreBase.savePressed'))
      .value;

  final _$productAtom = Atom(name: '_ProductStoreBase.product');

  @override
  Product? get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(Product? value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_ProductStoreBase.description');

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$priceAtom = Atom(name: '_ProductStoreBase.price');

  @override
  String? get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String? value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$cashbackAtom = Atom(name: '_ProductStoreBase.cashback');

  @override
  String? get cashback {
    _$cashbackAtom.reportRead();
    return super.cashback;
  }

  @override
  set cashback(String? value) {
    _$cashbackAtom.reportWrite(value, super.cashback, () {
      super.cashback = value;
    });
  }

  final _$searchAtom = Atom(name: '_ProductStoreBase.search');

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

  final _$filterByAtom = Atom(name: '_ProductStoreBase.filterBy');

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

  final _$loadingAtom = Atom(name: '_ProductStoreBase.loading');

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

  final _$errorAtom = Atom(name: '_ProductStoreBase.error');

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

  final _$_createAsyncAction = AsyncAction('_ProductStoreBase._create');

  @override
  Future<void> _create() {
    return _$_createAsyncAction.run(() => super._create());
  }

  final _$_updateAsyncAction = AsyncAction('_ProductStoreBase._update');

  @override
  Future<void> _update() {
    return _$_updateAsyncAction.run(() => super._update());
  }

  final _$deleteAsyncAction = AsyncAction('_ProductStoreBase.delete');

  @override
  Future<void> delete(Product product) {
    return _$deleteAsyncAction.run(() => super.delete(product));
  }

  final _$_failedCreateAsyncAction =
      AsyncAction('_ProductStoreBase._failedCreate');

  @override
  Future<void> _failedCreate() {
    return _$_failedCreateAsyncAction.run(() => super._failedCreate());
  }

  final _$_ProductStoreBaseActionController =
      ActionController(name: '_ProductStoreBase');

  @override
  void updateProductList(List<Product> upProducts) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.updateProductList');
    try {
      return super.updateProductList(upProducts);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProduct(Product value) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setProduct');
    try {
      return super.setProduct(value);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCashback(String value) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setCashback');
    try {
      return super.setCashback(value);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading() {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setLoading');
    try {
      return super.setLoading();
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterBy(String value) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setFilterBy');
    try {
      return super.setFilterBy(value);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearFields() {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product},
description: ${description},
price: ${price},
cashback: ${cashback},
search: ${search},
filterBy: ${filterBy},
loading: ${loading},
error: ${error},
itemCount: ${itemCount},
showProgress: ${showProgress},
validDescription: ${validDescription},
validPrice: ${validPrice},
validCashback: ${validCashback},
validForm: ${validForm},
savePressed: ${savePressed}
    ''';
  }
}
