import 'package:flutter/material.dart';

class InDevelopmentScreen extends StatelessWidget {
  const InDevelopmentScreen({Key? key, required this.nav}) : super(key: key);

  final bool nav;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: nav == false ? BackButton() : Container(),
      ),
      body: Center(
        child: Column(
        //crossAxisAlignment: CrossAxisAlignment,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.code,
            size: 50,
            color: Color(0xff3d63ff),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Em desenvolvimento...',
            style: themeData.textTheme.headline6,
          )
        ],
      ),
      )
    );
  }
}
