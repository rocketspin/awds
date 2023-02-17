import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProductPage')),
      body: Container(
        child: const Align(
          alignment: Alignment.center,
          child: Text('ProductPage Content'),
        ),
      ),
    );
  }
}
