import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceLevelsSelectionPage extends StatefulWidget {
  const PriceLevelsSelectionPage({Key? key}) : super(key: key);

  @override
  State<PriceLevelsSelectionPage> createState() =>
      _PriceLevelsSelectionPageState();
}

const List<Widget> priceLevelOptions = <Widget>[
  Text(
    'SRP',
    style: TextStyle(fontSize: 44),
  ),
  Text(
    'RETAIL',
    style: TextStyle(fontSize: 44),
  ),
  Text(
    'WHOLESALE',
    style: TextStyle(fontSize: 44),
  )
];

class _PriceLevelsSelectionPageState extends State<PriceLevelsSelectionPage> {
  final List<bool> _selectedOptions = <bool>[true, false, false];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Update Price Levels', style: TextStyle(fontSize: 36)),
                Text(
                  'Last Updated on November 14, 2022 @ 3:28PM PST',
                  style: TextStyle(fontSize: 16),
                )
              ],
            )),
        Divider(),
        Expanded(
            flex: 4,
            child: Container(
              height: 600,
              // color: Colors.green,
              child: ToggleButtons(
                direction: vertical ? Axis.vertical : Axis.horizontal,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < _selectedOptions.length; i++) {
                      _selectedOptions[i] = i == index;
                    }
                  });
                },
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                selectedBorderColor: Colors.blue[700],
                selectedColor: Colors.white,
                fillColor: Colors.blue[200],
                color: Colors.blue[400],
                constraints: const BoxConstraints(
                  minHeight: 100.0,
                  minWidth: 300.0,
                ),
                isSelected: _selectedOptions,
                children: priceLevelOptions,
              ),
            )),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 25),
                    child: Text(
                      '**Please note that by updating the current discount levels, the total computation of the cart will be automatically updated. New and existing items added to the cart will always follow the selected Price Level.',
                      style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 40),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Edit Price Levels',
                        style: TextStyle(fontSize: 25)),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15)),
                  ),
                )
              ],
            )),
      ],
    ));
  }
}
