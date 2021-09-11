import 'package:flutter/material.dart';
import 'package:semanda2flutter1/widgets/button.component.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(children: [
        Expanded(
            flex: 5,
            child: Container(
              child: Row(
                children: [Text("Zona Resultados")],
              ),
              color: Colors.blue,
            )),
        Expanded(
            flex: 1,
            child: Container(
              child: Row(
                children: [Text("Zona Operaciones")],
              ),
              color: Colors.red,
            )),
        Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CalculatorButton(widget: Text("7"), method: () {}),
                      CalculatorButton(widget: Text("8"), method: () {}),
                      CalculatorButton(widget: Text("9"), method: () {}),
                      CalculatorButton(widget: Text("/"), method: () {}),
                      CalculatorButton(
                          widget: Icon(Icons.arrow_back), method: () {}),
                      CalculatorButton(widget: Text("C"), method: () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CalculatorButton(widget: Text("4"), method: () {}),
                      CalculatorButton(widget: Text("5"), method: () {}),
                      CalculatorButton(widget: Text("6"), method: () {}),
                      CalculatorButton(widget: Text("*"), method: () {}),
                      CalculatorButton(widget: Text("("), method: () {}),
                      CalculatorButton(widget: Text(")"), method: () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CalculatorButton(widget: Text("1"), method: () {}),
                      CalculatorButton(widget: Text("2"), method: () {}),
                      CalculatorButton(widget: Text("3"), method: () {}),
                      CalculatorButton(widget: Text("-"), method: () {}),
                      CalculatorButton(widget: Text("Pow"), method: () {}),
                      CalculatorButton(widget: Text("Sqrt"), method: () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CalculatorButton(widget: Text("0"), method: () {}),
                      CalculatorButton(widget: Text("."), method: () {}),
                      CalculatorButton(widget: Text("%"), method: () {}),
                      CalculatorButton(widget: Text("+"), method: () {}),
                      CalculatorButton(
                          widget: Text("="), method: () {}, flex: 2),
                    ],
                  ),
                ],
              ),
              color: Colors.green,
            )),
      ]),
    );
  }
}
