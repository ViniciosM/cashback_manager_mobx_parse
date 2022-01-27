import 'package:cashback_mobx/models/product.dart';
import 'package:cashback_mobx/stores/product_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

showAlertDialogProduct(BuildContext context, String title, Product? product) {
  ThemeData themeData = Theme.of(context);
  Widget deleteButton = Padding(
    padding: EdgeInsets.all(10),
    child: TextButton(
      child: Text(
        "Excluir",
        style: TextStyle(color: themeData.colorScheme.error),
      ),
      onPressed: () {
        ProductStore productStore = GetIt.I<ProductStore>();
        productStore.delete(product!);
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
