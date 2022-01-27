import 'package:cashback_mobx/constants/keys.dart';
import 'package:cashback_mobx/models/customer.dart';
import 'package:cashback_mobx/repositories/parse_errors.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CustomerRepository {
  Future<void> create(Customer customer) async {
    try {
      final customerObject = ParseObject(keyCustomerTable);

      customerObject.set<String>(keyNameCustomer, customer.name ?? '');
      customerObject.set<String>(keyPhoneCustomer, customer.phone ?? '');
      customerObject.set<String>(keyEmailCustomer, customer.email ?? '');
      customerObject.set<String>(keyCpfCustomer, customer.cpf ?? '');
      customerObject.set<String>(keyNoteCustomer, customer.note ?? '');
      customerObject.set<int>(keyFrequencyCustomer, 0);
      customerObject.set<double>(keySalesValueCustomer, 0.0);
      customerObject.set<double>(keyCashbackBalanceCustomer, 0.0);

      final response = await customerObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao salvar customer');
    }
  }

  Future<List<Customer>> read(String search, String filterBy) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyCustomerTable));

    if (search.trim().isNotEmpty) {
      queryBuilder.whereContains(keyNameCustomer, search, caseSensitive: false);
    }

    
    if (filterBy == 'Vendas') {
      queryBuilder.orderByDescending(keySalesValueCustomer);
    } else if (filterBy == 'A-Z') {
      queryBuilder.orderByAscending(keyNameCustomer);
    } else if (filterBy == 'Frequência') {
      queryBuilder.orderByDescending(keyFrequencyCustomer);
    } else {
      queryBuilder.orderByAscending(keyNameCustomer);
    }
    

    final response = await queryBuilder.query();
    if (response.success && response.results != null) {
      return response.results!.map((po) => Customer.fromParse(po)).toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> update(Customer customer) async {
    try {
      var customerObject = ParseObject(keyCustomerTable)
        ..objectId = customer.idCustomer
        ..set<String>(keyNameCustomer, customer.name ?? '')
        ..set<String>(keyPhoneCustomer, customer.phone ?? '')
        ..set<String>(keyEmailCustomer, customer.email ?? '')
        ..set<String>(keyCpfCustomer, customer.cpf ?? '')
        ..set<String>(keyNoteCustomer, customer.note ?? '');

      final response = await customerObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao atualizar cliente');
    }
  }

  Future<void> updateCustomerSales(Customer customer, double value) async {
    int frequency = customer.frequency! + 1;
    double salesValue = customer.salesValue! + value;
    
    try {
      var customerObject = ParseObject(keyCustomerTable)
        ..objectId = customer.idCustomer
        ..set<int>(keyFrequencyCustomer, frequency)
        ..set<double>(keySalesValueCustomer, salesValue);

      final response = await customerObject.save();

      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      Future.error('Falha ao atualizar cliente');
    }
  }



  Future<void> delete(Customer customer) async {
    final parseObject = ParseObject(keyCustomerTable)
      ..set(keyIdCustomer, customer.idCustomer);

    final response = await parseObject.delete();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
