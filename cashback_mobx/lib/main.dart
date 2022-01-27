import 'package:cashback_mobx/navigation.dart';
import 'package:cashback_mobx/stores/cart_products_store.dart';
import 'package:cashback_mobx/stores/customer_store.dart';
import 'package:cashback_mobx/stores/product_store.dart';
import 'package:cashback_mobx/stores/sale_store.dart';
import 'package:cashback_mobx/style/fx_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

Future<void> initializeParse() async {
  const appId = 'ppt5dJuYxIstueg6MD0xY2hMVPMMGez4d09R39Fk';
  const clientKey = 'gVH5Kjv51sauxJibgHVRMtDPQRvyyGLlod8pPxu2';
  const serverURL = 'https://parseapi.back4app.com/';

  await Parse().initialize(
    appId,
    serverURL,
    clientKey: clientKey,
    autoSendSessionId: true,
    debug: true,
  );
}

void setupLocators() {
  GetIt.I.registerSingleton(ProductStore());
  GetIt.I.registerSingleton(CustomerStore());
  GetIt.I.registerSingleton(SaleStore());
  GetIt.I.registerSingleton(CartProductsStore());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cashback Manager',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: FxAppTheme.lightTheme,
      darkTheme: FxAppTheme.darkTheme,
      home: const Navigation(),
      //  home: GlassMorphism(),
    );
  }
}
