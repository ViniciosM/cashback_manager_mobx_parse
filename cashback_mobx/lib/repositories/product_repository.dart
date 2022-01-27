import 'package:cashback_mobx/constants/keys.dart';
import 'package:cashback_mobx/models/product.dart';
import 'package:cashback_mobx/repositories/parse_errors.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProductRepository {
  Future<void> create(Product product) async {
    try {
      final productObject = ParseObject(keyProductTable);

      productObject.set<String>(
          keyDescriptionProduct, product.description ?? '');
      productObject.set<double>(keyPriceProduct, product.price ?? 0);
      productObject.set<String>(keyShowPriceProduct, product.showPrice ?? '');
      productObject.set<double>(keyCashbackProduct, product.cashback ?? 0);
      productObject.set<int>(keyTotalSalesProduct, 0);

      final response = await productObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar product');
    }
  }

  Future<List<Product>> read(String search, String filterBy) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyProductTable));

    if (search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyDescriptionProduct, search,
          caseSensitive: false);
    }

    if (filterBy == 'Vendas') {
      queryBuilder.orderByDescending(keyTotalSalesProduct);
    } else if (filterBy == 'A-Z') {
      queryBuilder.orderByAscending(keyDescriptionProduct);
    } else if (filterBy == 'Maior valor') {
      queryBuilder.orderByDescending(keyPriceProduct);
    } else {
      queryBuilder.orderByAscending(keyDescriptionProduct);
    }

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!.map((po) => Product.fromParse(po)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> update(Product product) async {
    try {
      var productObject = ParseObject(keyProductTable)
        ..objectId = product.idProduct
        ..set<String>(keyDescriptionProduct, product.description ?? '')
        ..set<double>(keyPriceProduct, product.price ?? 0.0)
        ..set<String>(keyShowPriceProduct, product.showPrice ?? '0.0')
        ..set<double>(keyCashbackProduct, product.cashback ?? 0.0);

      final response = await productObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar product');
    }
  }

  Future<void> delete(Product product) async {
    final parseObject = ParseObject(keyProductTable)
      ..set(keyIdProduct, product.idProduct);

    final response = await parseObject.delete();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
