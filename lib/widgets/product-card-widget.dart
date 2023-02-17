import 'package:diveshop_pos/widgets/product-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.abc, size: 52,),
            title: Text('Product 1', style: TextStyle(fontSize: 22),),
            subtitle: Text('Product 1 Description. Lorem Ipsum some product mumbo jumbo'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('VIEW DETAILS'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProductPage(),
                    ),
                  );
                },
              ),
              TextButton(
                child: const Text('ADD TO CART'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          )
          // ElevatedButton(onPressed: addToCart, child: Text('Add to Cart'))
        ],
      ),

    );
  }
}
