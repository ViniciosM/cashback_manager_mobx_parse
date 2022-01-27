import 'package:cashback_mobx/screens/forms/form_customer.dart';
import 'package:cashback_mobx/screens/forms/form_product.dart';
import 'package:cashback_mobx/screens/in_development.dart';
import 'package:flutter/material.dart';

class InkWellCreate extends StatelessWidget {
  const InkWellCreate(
      {Key? key,
      required this.pathIcon,
      required this.page,
      required this.screenHeight})
      : super(key: key);

  final String pathIcon;
  final String page;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (page == 'Cliente') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FormCustomer()));
        } else if (page == 'Produto') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FormProduct()));
        } else if (page == 'Venda') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InDevelopmentScreen(nav: false,)));
        }
      },
      child: Column(children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: Container(
            child: Image.asset(pathIcon),
            color: Colors.grey[50],
            height: screenHeight * 0.12,
          ),
        ),
        SizedBox(height: screenHeight * 0.015),
        Text(
          page,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
