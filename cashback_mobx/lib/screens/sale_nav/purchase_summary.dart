import 'package:cashback_mobx/screens/sale_nav/selected_customer.dart';
import 'package:cashback_mobx/screens/sale_nav/widgets/card_product.dart';
import 'package:cashback_mobx/stores/sale_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PurchaseSummary extends StatelessWidget {
  const PurchaseSummary({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SaleStore saleStore = GetIt.I<SaleStore>();
    ThemeData themeData = Theme.of(context);
    //Customer? customer;
    return Scaffold(
      appBar: AppBar(
        title: Text('Venda'),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
            child: ElevatedButton(onPressed: () {}, child: Text('Finalizar')),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              saleStore.customer = await showDialogWidget(context);
            },
            child: Container(
                color: themeData.cardColor,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Observer(builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      saleStore.customer != null
                          ? Text(saleStore.customer!.name!,
                              style: themeData.textTheme.subtitle1)
                          : Text('Selecione o cliente',
                              style: themeData.textTheme.subtitle1),
                      Icon(
                        Icons.person_search_outlined,
                        color: Color(0xFF3d63ff),
                      )
                    ],
                  );
                })),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: saleStore.listProducts!.length,
              itemBuilder: (context, index) {
                return CardProduct(cartProduct: saleStore.listProducts![index]);
              }),
          SizedBox(
            height: 20,
          ),
          Container(
              color: themeData.cardColor,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Observer(builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Saldo cashback',
                            style: themeData.textTheme.bodyText1),
                        saleStore.customer != null
                            ? Text('R\$${saleStore.customer!.cashbackBalance}',
                                style: themeData.textTheme.subtitle2)
                            : Text('Cliente?',
                                style: themeData.textTheme.subtitle2),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total produtos',
                            style: themeData.textTheme.bodyText1),
                        Text('R\$${saleStore.totalProducts}',
                            style: themeData.textTheme.bodyText1),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cashback da compra',
                            style: themeData.textTheme.bodyText1),
                        Text('R\$55,20', style: themeData.textTheme.bodyText1),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total compra',
                            style: themeData.textTheme.bodyText1),
                        Text('R\$55,20', style: themeData.textTheme.bodyText1),
                      ],
                    ),
                  ],
                );
              }))
        ],
      ),
    );
  }
}
