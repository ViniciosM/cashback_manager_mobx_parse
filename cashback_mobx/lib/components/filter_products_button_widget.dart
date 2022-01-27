import 'package:cashback_mobx/stores/product_store.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class FilterProductsButtonWidget extends StatelessWidget {
  const FilterProductsButtonWidget(
      {Key? key, required this.op1, required this.op2, required this.op3})
      : super(key: key);

  final String op1, op2, op3;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    ThemeData themeData = Theme.of(context);
    ProductStore _productStore = GetIt.I<ProductStore>();
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
          Observer(builder: (context) {
            return CustomRadioButton(
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
                    textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                radioButtonValue: (value) {
                  switch (value) {
                    case 'A-Z':
                      _productStore.setFilterBy(value.toString());
                      print(value);
                      break;
                    case 'Maior valor':
                      _productStore.setFilterBy(value.toString());
                      print(value);
                      break;
                    case 'Vendas':
                      _productStore.setFilterBy(value.toString());
                      print(value);
                      break;
                    default:
                      _productStore.setFilterBy('A-Z');
                      print(value);
                      break;
                  }
                },
                selectedColor: Theme.of(context).primaryColor);
          })
        ]),
      ]),
    );
  }
}
