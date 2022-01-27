import 'package:cashback_mobx/models/sale.dart';
import 'package:flutter/material.dart';

class CustomerRow extends StatelessWidget {
  const CustomerRow({Key? key, required this.sale}) : super(key: key);

  final Sale sale;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Table(
            //border: TableBorder.symmetric(),
            columnWidths: const {0: FractionColumnWidth(.4)},
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            //defaultColumnWidth: const IntrinsicColumnWidth(),
            children: [
              TableRow(children: [
                Text(sale.customer!.name!,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
                Text('R\$${sale.totalValue}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
                Text('R\$${sale.totalCashback}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
                Text(sale.customer!.frequency!.toString(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
