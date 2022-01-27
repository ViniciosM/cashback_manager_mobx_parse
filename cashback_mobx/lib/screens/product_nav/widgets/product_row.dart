import 'package:cashback_mobx/models/product.dart';
import 'package:flutter/material.dart';

class ProductRow extends StatelessWidget {
  const ProductRow({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Table(
            //border: TableBorder.symmetric(),
            columnWidths: const {0: FractionColumnWidth(.4),
            3: FractionColumnWidth(.1)
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            //defaultColumnWidth: const IntrinsicColumnWidth(),
            children: [
              TableRow(children: [
                Text(product.description!,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
                Text('R\$${product.price}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
                Text('${product.cashback}%',
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
