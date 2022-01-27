import 'package:cashback_mobx/screens/home/widgets/card_dashboard.dart';
import 'package:cashback_mobx/screens/home/widgets/custom_app_bar.dart';
import 'package:cashback_mobx/screens/home/widgets/inkwell_create.dart';
import 'package:cashback_mobx/stores/customer_store.dart';
import 'package:cashback_mobx/stores/product_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: const CustomAppBar(),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildDashboards(screenHeight),
          _buildInkwellCreate(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'CASHBACK MANAGER',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3d63ff),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildDashboards(double screenHeight) {
    ProductStore productStore = GetIt.I<ProductStore>();
    CustomerStore customerStore = GetIt.I<CustomerStore>();
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardDashboard(
                    title: 'TOTAL DE VENDAS',
                    value: 'R\$34.589,90',
                    icon: Icons.arrow_circle_up_outlined,
                    color: Colors.green),
                CardDashboard(
                    title: 'CLIENTES FIDELIZADOS',
                    value: '${customerStore.customerList.length}',
                    icon: Icons.person_outline_outlined,
                    color: Colors.blue),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                CardDashboard(
                    title: 'TOTAL DE CASHBACK',
                    value: 'R\$2.962,89',
                    icon: MdiIcons.currencyBrl,
                    color: Colors.amber),
                CardDashboard(
                    title: 'ITENS NA LOJA',
                    value: '${productStore.productList.length}',
                    icon: MdiIcons.packageVariantClosed,
                    color: Colors.purple),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildInkwellCreate(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(20),
        //color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Cadastro',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWellCreate(
              screenHeight: screenHeight,
              page: 'Cliente',
              pathIcon: 'assets/icons/cliente-64x.png',
            ),
            InkWellCreate(
              screenHeight: screenHeight,
              page: 'Produto',
              pathIcon: 'assets/icons/produto-64x.png',
            ),
            InkWellCreate(
              screenHeight: screenHeight,
              page: 'Venda',
              pathIcon: 'assets/icons/venda-64x.png',
            ),
          ])
        ]),
      ),
    );
  }
}
