// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_products_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartProductsStore on _CartProductsStoreBase, Store {
  final _$productAtom = Atom(name: '_CartProductsStoreBase.product');

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

  final _$quantityAtom = Atom(name: '_CartProductsStoreBase.quantity');

  @override
  int? get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int? value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$totalValueProductsAtom =
      Atom(name: '_CartProductsStoreBase.totalValueProducts');

  @override
  double? get totalValueProducts {
    _$totalValueProductsAtom.reportRead();
    return super.totalValueProducts;
  }

  @override
  set totalValueProducts(double? value) {
    _$totalValueProductsAtom.reportWrite(value, super.totalValueProducts, () {
      super.totalValueProducts = value;
    });
  }

  final _$_CartProductsStoreBaseActionController =
      ActionController(name: '_CartProductsStoreBase');

  @override
  void setProduct(Product value) {
    final _$actionInfo = _$_CartProductsStoreBaseActionController.startAction(
        name: '_CartProductsStoreBase.setProduct');
    try {
      return super.setProduct(value);
    } finally {
      _$_CartProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(int value) {
    final _$actionInfo = _$_CartProductsStoreBaseActionController.startAction(
        name: '_CartProductsStoreBase.setQuantity');
    try {
      return super.setQuantity(value);
    } finally {
      _$_CartProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotalValueProducts(double value) {
    final _$actionInfo = _$_CartProductsStoreBaseActionController.startAction(
        name: '_CartProductsStoreBase.setTotalValueProducts');
    try {
      return super.setTotalValueProducts(value);
    } finally {
      _$_CartProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product},
quantity: ${quantity},
totalValueProducts: ${totalValueProducts}
    ''';
  }
}
