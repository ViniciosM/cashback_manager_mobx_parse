import 'package:cashback_mobx/models/customer.dart';
import 'package:cashback_mobx/stores/customer_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

showAlertDialogCustomer(BuildContext context, String title, Customer customer) {
  ThemeData themeData = Theme.of(context);
  Widget deleteButton = Padding(
    padding: EdgeInsets.all(10),
    child: TextButton(
      child: Text(
        "Excluir",
        style: TextStyle(color: themeData.colorScheme.error),
      ),
      onPressed: () {
        CustomerStore customerStore = GetIt.I<CustomerStore>();
        customerStore.delete(customer);
        Navigator.pop(context);
      },
    ),
  );
  Widget cancelButton = Padding(
    padding: const EdgeInsets.all(10),
    child: TextButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Excluir $title"),
    content: const Text("Gostaria mesmo de excluir esse cadastro?"),
    actions: [
      deleteButton,
      cancelButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
