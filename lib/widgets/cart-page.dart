import 'package:data_table_2/data_table_2.dart';
import 'package:diveshop_pos/widgets/checkout-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Container(
          padding: EdgeInsets.all(20),
          // color: Colors.grey,
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 600,
                    columns: const [
                      DataColumn2(
                        label: Text('Product Name'),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Text('Description'),
                      ),
                      DataColumn(
                        label: Text('Price'),
                        numeric: true,
                      ),
                      DataColumn(
                        label: Text('Quantity'),
                        numeric: true,
                      ),
                      DataColumn(
                        label: Text('Total Price'),
                        numeric: true,
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        20,
                        (index) => DataRow(cells: [
                              DataCell(Text('A' * (10 - index % 10))),
                              DataCell(Text('B' * (10 - (index + 5) % 10))),
                              DataCell(Text((index + 1).toString())),
                              DataCell(Text('1')),
                              DataCell(Text((index + 1).toString())),
                            ]))),
              ),
              Divider(),
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CheckoutPage(),
                          ),
                        );
                      },
                      child: Text('Checkout', style: TextStyle(fontSize: 22)),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(25, 15, 25, 15)),
                    ),
                  )),
            ],
          )),
    );
  }
}
