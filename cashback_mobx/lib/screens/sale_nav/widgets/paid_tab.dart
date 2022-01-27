import 'package:cashback_mobx/components/filter_products_button_widget.dart';
import 'package:flutter/material.dart';

class PaidTab extends StatelessWidget {
  const PaidTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const FilterProductsButtonWidget(
              op1: 'Data', op2: 'Nome', op3: 'Maior valor'),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {},
            child: Card(
              color: Colors.grey[150],
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Table(
                  //border: TableBorder.all(),
                  columnWidths: const {
                    0: FractionColumnWidth(.3),
                    1: FractionColumnWidth(.2)
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  //defaultColumnWidth: const IntrinsicColumnWidth(),
                  children: const [
                    TableRow(children: [
                      Text('Cliente',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      Text('Data',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      Text('Valor',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      Text('',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                    ])
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Table(
                  //border: TableBorder.symmetric(),
                  columnWidths: const {
                    0: FractionColumnWidth(.3),
                    1: FractionColumnWidth(.2)
                  },

                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  //defaultColumnWidth: const IntrinsicColumnWidth(),
                  children: [
                    TableRow(children: [
                      Text('Ana Maria das Graças',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                      Text('15/10/21',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                      Text('R\$35,50',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                      ElevatedButton(onPressed: () {}, child: Text('Desfazer')),
                    ])
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
