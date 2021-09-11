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
                      CalculatorButton(text: "7", method: () {}),
                      CalculatorButton(text: "8", method: () {}),
                      CalculatorButton(text: "9", method: () {}),
                      CalculatorButton(text: "/", method: () {}),
                      CalculatorButton(text: "<--", method: () {}),
                      CalculatorButton(text: "C", method: () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CalculatorButton(text: "4", method: () {}),
                      CalculatorButton(text: "5", method: () {}),
                      CalculatorButton(text: "6", method: () {}),
                      CalculatorButton(text: "*", method: () {}),
                      CalculatorButton(text: "(", method: () {}),
                      CalculatorButton(text: ")", method: () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CalculatorButton(text: "1", method: () {}),
                      CalculatorButton(text: "2", method: () {}),
                      CalculatorButton(text: "3", method: () {}),
                      CalculatorButton(text: "-", method: () {}),
                      CalculatorButton(text: "Pow", method: () {}),
                      CalculatorButton(text: "Sqrt", method: () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CalculatorButton(text: "0", method: () {}),
                      CalculatorButton(text: ".", method: () {}),
                      CalculatorButton(text: "%", method: () {}),
                      CalculatorButton(text: "+", method: () {}),
                      CalculatorButton(text: "=", method: () {}, flex: 2),
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
