import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cashback_mobx/screens/customer_nav/table_customers.dart';
import 'package:cashback_mobx/screens/home/home.dart';
import 'package:cashback_mobx/screens/in_development.dart';
import 'package:cashback_mobx/screens/product_nav/table_product.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: [
            HomeScreen(),
            Tablecustomer(),
            InDevelopmentScreen(nav: true),
            TableProduct(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController!.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: const Icon(MdiIcons.homeOutline),
            title: const Text('Início'),
            activeColor: const Color(0xff3d63ff),
          ),
          BottomNavyBarItem(
            icon: const Icon(MdiIcons.accountOutline),
            title: const Text('Clientes'),
            activeColor: const Color(0xff3d63ff),
          ),
          BottomNavyBarItem(
            icon: const Icon(MdiIcons.currencyBrl),
            title: const Text('Vendas'),
            activeColor: const Color(0xff3d63ff),
          ),
          BottomNavyBarItem(
            icon: const Icon(MdiIcons.packageVariantClosed),
            title: const Text('Produtos'),
            activeColor: const Color(0xff3d63ff),
          ),
        ],
      ),
    );
  }
}
