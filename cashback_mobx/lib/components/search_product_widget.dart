import 'package:cashback_mobx/stores/product_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SearchProductWidget extends StatelessWidget {
  const SearchProductWidget({Key? key, required this.context}) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    late ThemeData themeData;
    themeData = Theme.of(context);
    ProductStore _productStore = GetIt.I<ProductStore>();
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Pesquisar produtos",
          border: themeData.inputDecorationTheme.border,
          enabledBorder: themeData.inputDecorationTheme.border,
          focusedBorder: themeData.inputDecorationTheme.focusedBorder,
          prefixIcon: const Icon(Icons.search, size: 24),
          
        ),
        onChanged: _productStore.setSearch,
      ),
    );
  }
}
