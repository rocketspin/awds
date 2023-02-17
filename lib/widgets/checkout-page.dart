import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Bank Transfer',
  'Cash',
  'Credit Card',
  'E-wallet'
];

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Container(
          padding: EdgeInsets.all(20),
          // color: Colors.grey,
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Select your preferred Payment Method', style: TextStyle(fontSize: 16),),
                          Text('**This can a!ect discounts when applicable.', style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        // icon: const Icon(Icons.download),
                        elevation: 16,
                        style: const TextStyle(color: Colors.blueAccent, fontSize: 18),
                        underline: Container(
                          height: 2,
                          color: Colors.blueAccent,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  )),
              Expanded(
                flex: 7,
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
                        label: Text('Quantity'),
                        numeric: true,
                      ),
                      DataColumn(
                        label: Text('USD'),
                        numeric: true,
                      ),
                      DataColumn(
                        label: Text('EUR'),
                        numeric: true,
                      ),
                      DataColumn(
                        label: Text('AUD'),
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
                              DataCell(Text('1')),
                              DataCell(Text((index % 2 == 0 ? index + 1 : '')
                                  .toString())),
                              DataCell(Text((index % 3 == 0 ? index + 1 : '')
                                  .toString())),
                              DataCell(Text((index % 4 == 0 ? index + 1 : '')
                                  .toString())),
                              DataCell(Text('PHP '  + (index + 1).toString())),
                            ]))),
              ),
              Divider(),
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Confirmation'),
                          content: const Text('Are you sure you want to proceed to payment? Once done, your cart will be reset.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
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
