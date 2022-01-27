import 'package:cashback_mobx/stores/customer_store.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FilterCustomersButtonWidget extends StatelessWidget {
  const FilterCustomersButtonWidget(
      {Key? key, required this.op1, required this.op2, required this.op3})
      : super(key: key);

  final String op1;
  final String op2;
  final String op3;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ThemeData themeData = Theme.of(context);
    CustomerStore customerStore = GetIt.I<CustomerStore>();
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Filtrar por:',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: [
          CustomRadioButton(
              width: width * 0.25,
              //autoWidth: true,
              //spacing: 3,
              enableShape: true,
              elevation: 0,
              absoluteZeroSpacing: true,
              //shapeRadius: 5,
              defaultSelected: op1,
              margin: const EdgeInsets.only(right: 10),
              unSelectedColor: Theme.of(context).canvasColor,
              buttonLables: [
                op1,
                op2,
                op3,
              ],
              buttonValues: [
                op1,
                op2,
                op3,
              ],
              buttonTextStyle: const ButtonTextStyle(
                  selectedColor: Colors.white,
                  unSelectedColor: Colors.black,
                  textStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              radioButtonValue: (value) {
                switch (value) {
                  case 'A-Z':
                    customerStore.setFilterBy('A-Z');
                    break;
                  case 'Vendas':
                    customerStore.setFilterBy('Vendas');
                    break;
                  case 'Frequência':
                    customerStore.setFilterBy('Frequência');
                    break;
                  default:
                    customerStore.setFilterBy('A-Z');
                }
              },
              selectedColor: Theme.of(context).primaryColor),
        ]),
      ]),
    );
  }
}
