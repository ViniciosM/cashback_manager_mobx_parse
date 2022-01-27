import 'package:cashback_mobx/components/filter_customers_button_widget.dart';
import 'package:cashback_mobx/components/search_customer_widget.dart';
import 'package:cashback_mobx/components/show_alert_dialog_customer.dart';
import 'package:cashback_mobx/models/customer.dart';
import 'package:cashback_mobx/screens/forms/form_customer.dart';
import 'package:cashback_mobx/stores/customer_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class Tablecustomer extends StatelessWidget {
  const Tablecustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    CustomerStore _customerStore = GetIt.I<CustomerStore>();
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return Observer(builder: (_) {
      if (_customerStore.error != null) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                color: Color(0xfff0323c),
                size: 100,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Ocorreu um erro!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xfff0323c),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              IconButton(
                  onPressed: () {
                    _customerStore.setFilterBy('A-Z');
                  },
                  icon: Icon(Icons.refresh_rounded, color: Color(0xFF3d63ff))),
            ],
          ),
        );
      } else if (_customerStore.showProgress) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Color(0xFF3d63ff)),
          ),
        );
      } else if (_customerStore.customerList.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.10,
            ),
            Text(
              'Nenhum cliente encontrado.',
              style: themeData.textTheme.headline6,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            IconButton(
                onPressed: () {
                  _customerStore.setSearch('');
                },
                icon: const Icon(Icons.refresh_rounded,
                    color: Color(0xFF3d63ff))),
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
              SearchCustomerWidget(context: context),
              const FilterCustomersButtonWidget(
                  op1: 'A-Z', op2: 'Vendas', op3: 'Frequência'),
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
                        "Cliente",
                        style: themeData.textTheme.subtitle1,
                      ),
                    ),
                    DataColumn(
                      label:
                          Text("Venda", style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text("Cashback",
                          style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text("F.", style: themeData.textTheme.subtitle1),
                    ),
                    DataColumn(
                      label: Text("", style: themeData.textTheme.subtitle1),
                    ),
                  ],
                  rows: List.generate(
                    _customerStore.customerList.length,
                    (index) => customerDataRow(
                        _customerStore.customerList[index], context),
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

DataRow customerDataRow(Customer customer, BuildContext context) {
  ThemeData themeData = Theme.of(context);
  CustomerStore _customerStore = GetIt.I<CustomerStore>();
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  var textStyle = themeData.textTheme.bodyText2;
  return DataRow(
    cells: [
      DataCell(Text(
        customer.name!,
        style: textStyle,
      )),
      DataCell(Text(
        'R\$${customer.salesValue!}',
        style: textStyle,
      )),
      DataCell(Text('${customer.cashbackBalance!}', style: textStyle)),
      DataCell(Text('${customer.frequency!}', style: textStyle)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                _customerStore.setCustomer(customer);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FormCustomer(
                              edit: true,
                            )));
              },
              icon: const Icon(
                Icons.edit_outlined,
                color: Color(0xFF3d63ff),
              )),
          IconButton(
              onPressed: () {
                showAlertDialogCustomer(context, 'cliente', customer);
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
