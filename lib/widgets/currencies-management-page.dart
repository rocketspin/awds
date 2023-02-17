import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CurrenciesManagement extends StatefulWidget {
  const CurrenciesManagement({Key? key}) : super(key: key);

  @override
  State<CurrenciesManagement> createState() => _CurrenciesManagementState();
}

class _CurrenciesManagementState extends State<CurrenciesManagement> {

  final form = FormGroup({
    'usd_to_php': FormControl<double>(value: 57.27),
    'eur_to_php': FormControl<double>(value: 59.09),
    'aud_to_php': FormControl<double>(value: 38.29),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: SingleChildScrollView(
        child: ReactiveForm(
            formGroup: form,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  child: ReactiveTextField(
                    formControlName: 'usd_to_php',
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                      ),
                      hintText: 'USD to PHP',
                      labelText: 'USD to PHP',
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  child: ReactiveTextField(
                    formControlName: 'eur_to_php',
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                      ),
                      hintText: 'EUR to PHP',
                      labelText: 'EUR to PHP',
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  child: ReactiveTextField(
                    formControlName: 'aud_to_php',
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2.0),
                      ),
                      hintText: 'AUD to PHP',
                      labelText: 'AUD to PHP',
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Confirmation'),
                        content: const Text('Are you sure you want to update the currency exchange rates?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: _onSubmit,
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    child: const Center(
                        child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 34,
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const SizedBox(
                  child: Text(
                    '**Please note that updating the currencies will a!ect the current conversions of products to Philippine Pesos (Php). These currency exchange rates are only applied to this device only.',
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  _onSubmit() {
    print(form.rawValue);
  }
}
