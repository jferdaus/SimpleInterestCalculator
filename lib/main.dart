import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Interest Calculator",
    home: SIForm(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
    ),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SIFormState();
    throw UnimplementedError();
  }
}

class SIFormState extends State<SIForm> {
  final _formKey = GlobalKey<FormState>();
  var _Currencies = ["Rupees", "Pounds", "Dollars"];
  String _selectedCurrency = "Rupees";

  String displayVal = "";

  TextEditingController principalController = TextEditingController();

  TextEditingController roiController = TextEditingController();

  TextEditingController termController = TextEditingController();

  final _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    void dropdownCallback(String? selectedValue) {
      if (selectedValue is String) {
        setState(() {
          _selectedCurrency = selectedValue;
        });
      }
    }

    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text(
              "Simple Interest Calculator",
              style: TextStyle(fontSize: 30.0),
            )),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: ListView(
                children: <Widget>[
                  getImageAsset(),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding * 4, bottom: _minimumPadding),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: principalController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Principal amount.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Principal",
                            errorStyle: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20.0,
                            ),
                            labelStyle: TextStyle(fontSize: 25.0),
                            hintText: "Enter Principal. e.g. 12000",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: _minimumPadding, bottom: _minimumPadding),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: roiController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Please enter Rate of Interest amount." ;
                          }
                          return null ;
                        },
                        decoration: InputDecoration(
                            labelStyle: TextStyle(fontSize: 25.0),
                            errorStyle: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20.0,
                            ),
                            labelText: "Rate of Interest",
                            hintText: "In Percent",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: termController,
                          validator: (value){
                            if(value==null || value.isEmpty){
                              return "Please enter Term" ;
                            }
                            return null ;
                          },

                          decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 25.0),
                              errorStyle: TextStyle(
                                color: Colors.yellow,
                                fontSize: 15.0
                              ),
                              labelText: "Term",
                              hintText: "Time in Years",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                        Container(
                          width: _minimumPadding * 5,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                                items: _Currencies.map((String dropDownValue) {
                                  return DropdownMenuItem<String>(
                                      value: dropDownValue,
                                      child: Text(
                                        dropDownValue,
                                        style: TextStyle(fontSize: 25.0),
                                      ));
                                }).toList(),
                                value: _selectedCurrency,
                                onChanged: dropdownCallback))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: ElevatedButton(
                          child: Text(
                            "Calculate",
                            style: TextStyle(fontSize: 25.0),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              shape: RoundedRectangleBorder()),
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                this.displayVal = _calculateTotalReturns();
                              }
                            });
                          },
                        )),
                        Container(
                          width: _minimumPadding * 2,
                        ),
                        Expanded(
                            child: ElevatedButton(
                          child: Text(
                            "Reset",
                            style: TextStyle(fontSize: 25.0),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                              shape: RoundedRectangleBorder()),
                          onPressed: () {
                            setState(() {
                              _reset();
                            });
                          },
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: _minimumPadding * 3,
                      right: _minimumPadding * 3,
                      left: _minimumPadding * 3,
                      bottom: _minimumPadding * 3,
                    ),
                    child: Center(
                      child: Text(
                        displayVal,
                        style: TextStyle(fontSize: 27.0),
                      ),
                    ),
                  )
                ],
              ),
            )));

    throw UnimplementedError();
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmount = principal + (principal * roi * term) / 100;

    String res =
        "After $term years, your investment will be worth $totalAmount $_selectedCurrency";

    return res;
  }

  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    displayVal = '';
    _selectedCurrency = _Currencies[0];
  }
}

Widget getImageAsset() {
  AssetImage assetImage = const AssetImage("images/money.png");
  Image image = Image(
    image: assetImage,
    width: 125,
    height: 125,
  );

  return Container(
    child: image,
  );
}
