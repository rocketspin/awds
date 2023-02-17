import 'package:diveshop_pos/widgets/product-card-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'navigation-list-page.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String? _qrInfo = 'Scan a QR/Bar code';
  bool _camState = false;

  final form = FormGroup({
    'search_field': FormControl<String>(value: ''),
  });

  _qrCallback(String? code) {
    setState(() {
      _camState = false;
      _qrInfo = code;
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    addToCart() {}

    return Scaffold(
        appBar: AppBar(
          title: Text('Scan Products'),
        ),
        resizeToAvoidBottomInset: false,
        drawer: const Drawer(child: NavigationList()),
        body: Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            color: Colors.grey[200],
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ReactiveForm(
                    formGroup: form,
                    child: Column(
                      children: [
                        SizedBox(
                          child: ReactiveTextField(
                            formControlName: 'search_field',
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 2.0),
                              ),
                              hintText: 'Search Products',
                              labelText: 'Search Products',
                              alignLabelWithHint: true,
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 9,
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Container(
                                color: Colors.green,
                                child: _camState
                                    ? Center(
                                        child: SizedBox(
                                          // height: 652,
                                          // width: 800,
                                          child: QRBarScannerCamera(
                                            onError: (context, error) => Text(
                                              error.toString(),
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            qrCodeCallback: (code) {
                                              _qrCallback(code);
                                            },
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: Text(_qrInfo!),
                                      ),
                              )),
                          Expanded(
                              flex: 4,
                              child: Container(
                                // color: Colors.red,
                                child: ListView(
                                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                                  children: [
                                    ProductCard(),
                                    ProductCard(),
                                    ProductCard(),
                                    ProductCard(),
                                    ProductCard(),
                                    ProductCard(),
                                  ]
                                )
                              ))
                        ],
                      ),
                    ))
              ],
            )));

  }
}
