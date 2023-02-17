import 'package:diveshop_pos/widgets/currencies-management-page.dart';
import 'package:diveshop_pos/widgets/inventory-page.dart';
import 'package:diveshop_pos/widgets/price-levels-selection-page.dart';
import 'package:flutter/material.dart';

import 'navigation-list-page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: const Drawer(child: NavigationList()),
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.currency_exchange), text: 'Currencies',),
                Tab(icon: Icon(Icons.discount), text: 'Price Levels',),
                Tab(icon: Icon(Icons.inventory), text: 'Inventory',),
              ],
            ),
            title: const Text('Admin Page'),
          ),
          body: const TabBarView(
            children: [
              CurrenciesManagement(),
              PriceLevelsSelectionPage(),
              InventoryPage(),
            ],
          ),
        ),
      ),
    );
  }
}
