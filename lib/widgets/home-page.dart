import 'package:diveshop_pos/widgets/scanner-page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:galleryimage/galleryimage.dart';

import 'package:flutter/material.dart';

import 'navigation-list-page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Aquaventure Whitetip Dive Supply'),
        ),
        drawer: const Drawer(child: NavigationList()),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 8.0,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScannerPage(),
                    ));
                  },
                  icon: Icon(Icons.barcode_reader),
                  label: const Text('Start Scanning')),
            ],
          ),
        ));
  }
}
