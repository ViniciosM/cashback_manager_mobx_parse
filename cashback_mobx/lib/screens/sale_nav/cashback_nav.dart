import 'package:cashback_mobx/screens/sale_nav/widgets/paid_tab.dart';
import 'package:cashback_mobx/screens/sale_nav/widgets/pending_tab.dart';
import 'package:cashback_mobx/style/app_theme.dart';
import 'package:flutter/material.dart';

class CachbackNavScreen extends StatefulWidget {
  const CachbackNavScreen({Key? key}) : super(key: key);

  @override
  _CachbackNavScreenState createState() => _CachbackNavScreenState();
}

class _CachbackNavScreenState extends State<CachbackNavScreen> {
  late ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          height: 0,
          width: 0,
        ),
        title: Text("Cashbacks",
            style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                fontWeight: 600)),
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            leading: Container(
              height: 0,
              width: 0,
            ),
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  tabs: [
                    Tab(
                        child: Text("Pendente",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600))),
                    Tab(
                        child: Text("Pago",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600))),
                  ],
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              PendingTab(),
              PaidTab(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTabContent(String text) {
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      body: Center(
        child: Text(
          text,
          style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
              fontWeight: 600),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
