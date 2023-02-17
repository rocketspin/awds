import 'package:diveshop_pos/widgets/admin-page.dart';
import 'package:diveshop_pos/widgets/scanner-page.dart';
import 'package:flutter/material.dart';

import 'admin-auth-page.dart';
import 'cart-page.dart';
import 'home-page.dart';

const appBlue = Color.fromARGB(255, 11, 83, 148);

class NavigationList extends StatelessWidget {
  const NavigationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: appBlue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Homepage(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text('Scan Now'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ScannerPage(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text('Cart'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          },
        ),
        Divider(),
        ListTile(
          title: const Text('Admin'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AdminPage(),
              ),
            );
          },
        ),
        Divider()
      ],
    );
  }
}
