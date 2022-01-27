import 'package:cashback_mobx/components/filter_products_button_widget.dart';
import 'package:cashback_mobx/components/search_product_widget.dart';
import 'package:cashback_mobx/components/show_alert_dialog_product.dart';
import 'package:cashback_mobx/models/product.dart';
import 'package:cashback_mobx/screens/forms/form_product.dart';
import 'package:cashback_mobx/stores/product_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class TableProduct extends StatelessWidget {
  const TableProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    ProductStore _productStore = GetIt.I<ProductStore>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Observer(builder: (_) {
      if (_productStore.error != null) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                color: Colors.white,
                size: 100,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Ocorreu um erro!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              IconButton(
                onPressed: () {
                  _productStore.setSearch('');
                },
                icon: Icon(Icons.refresh_rounded, color: Color(0xFF3d63ff))),
            ],
          ),
        );
      } else if (_productStore.showProgress) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        );
      } else if (_productStore.productList.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.10,
            ),
            Text(
              'Nenhum produto encontrado.',
              style: themeData.textTheme.headline6,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            IconButton(
                onPressed: () {
                  _productStore.setSearch('');
                },
                icon: Icon(Icons.refresh_rounded, color: Color(0xFF3d63ff))),
          ],
        );
      }
      return SingleChildScrollView(
          //scrollDirection: Axis.horizontal,
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2), //color of shadow
                spreadRadius: 1, //spread radius
                blurRadius: 2, // blur radius
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchProductWidget(context: context),
              const FilterProductsButtonWidget(
                  op1: 'A-Z', op2: 'Maior valor', op3: 'Vendas'),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                width: double.infinity,
                child: DataTable(
                  headingTextStyle: themeData.textTheme.subtitle1,
                  dataTextStyle: themeData.textTheme.bodyText2,
                  horizontalMargin: 0,
                  columnSpacing: 10,
                  columns: [
                    DataColumn(
                      label: Text(
                        "Produto",
                        style: themeData.textTheme.subtitle1,
                      ),
                    ),
                    DataColumn(
                      label:
                          Text("Valor", style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text("Cashback",
                          style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label:
                          Text("Vendas", style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text("", style: themeData.textTheme.subtitle1),
                    ),
                  ],
                  rows: List.generate(
                    _productStore.productList.length,
                    (index) => productDataRow(
                        _productStore.productList[index], context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    });
  }
}

DataRow productDataRow(Product product, BuildContext context) {
  ThemeData themeData = Theme.of(context);
  ProductStore _productStore = GetIt.I<ProductStore>();
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  var textStyle = themeData.textTheme.bodyText2;
  return DataRow(
    cells: [
      DataCell(Text(
        product.description!,
        style: textStyle,
      )),
      DataCell(Text(
        product.showPrice!,
        style: textStyle,
      )),
      DataCell(Text('${product.cashback!}', style: textStyle)),
      DataCell(Text('${product.totalSales!}', style: textStyle)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                _productStore.setProduct(product);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FormProduct(
                              edit: true,
                            )));
              },
              icon: const Icon(
                Icons.edit_outlined,
                color: Color(0xFF3d63ff),
              )),
          IconButton(
              onPressed: () {
                showAlertDialogProduct(context, 'produto', product);
              },
              icon: const Icon(
                Icons.delete_outline,
                color: Color(0xfff0323c),
              )),
        ],
      )),
    ],
  );
}
