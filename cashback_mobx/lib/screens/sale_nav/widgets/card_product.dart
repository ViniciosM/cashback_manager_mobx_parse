import 'package:cashback_mobx/models/cart_products.dart';
import 'package:cashback_mobx/stores/sale_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({Key? key, required this.cartProduct}) : super(key: key);
  final CartProducts cartProduct;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    SaleStore saleStore = GetIt.I<SaleStore>();
    double height = MediaQuery.of(context).size.height;
    return Observer(builder: (_) {
      return Container(
          //width: MediaQuery.of(context).size.width * 0.7,
          height: height * 0.12,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: themeData.cardColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${cartProduct.product!.description}',
                    style: themeData.textTheme.subtitle1,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Remover',
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Qtd: ${cartProduct.quantity} x',
                        style: themeData.textTheme.bodyText2,
                      ),
                      Text(
                        'R\$${(cartProduct.totalValueProducts!)}',
                        style: themeData.textTheme.bodyText2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove,
                            color: Color(0xFF3d63ff),
                          )),
                      Text('01', style: themeData.textTheme.subtitle2),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: Color(0xFF3d63ff),
                          )),
                    ],
                  )
                ],
              ),
            ],
          ));
    });
  }
}
