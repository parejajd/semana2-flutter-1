import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:semanda2flutter1/widgets/button.component.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String expresion = '0';
  String resultado = '_';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(children: [
        Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                resultado,
                style: TextStyle(fontSize: 38),
              ),
              //color: Colors.blue,
            )),
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(
                expresion,
                style: TextStyle(fontSize: 38),
              ),
              //color: Colors.red,
            )),
        Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CalculatorButton(
                          widget: Text("7"),
                          method: () {
                            onPressButton("7");
                          }),
                      CalculatorButton(
                          widget: Text("8"),
                          method: () {
                            onPressButton("8");
                          }),
                      CalculatorButton(
                          widget: Text("9"),
                          method: () {
                            onPressButton("9");
                          }),
                      CalculatorButton(
                          widget: Text("/"),
                          method: () {
                            onPressButton("/");
                          }),
                      CalculatorButton(
                          widget: Icon(Icons.arrow_back),
                          method: () {
                            onPressButton("b");
                          }),
                      CalculatorButton(
                          widget: Text("C"),
                          method: () {
                            onPressButton("c");
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CalculatorButton(
                          widget: Text("4"),
                          method: () {
                            onPressButton("4");
                          }),
                      CalculatorButton(
                          widget: Text("5"),
                          method: () {
                            onPressButton("5");
                          }),
                      CalculatorButton(
                          widget: Text("6"),
                          method: () {
                            onPressButton("6");
                          }),
                      CalculatorButton(
                          widget: Text("*"),
                          method: () {
                            onPressButton("*");
                          }),
                      CalculatorButton(
                          widget: Text("("),
                          method: () {
                            onPressButton("(");
                          }),
                      CalculatorButton(
                          widget: Text(")"),
                          method: () {
                            onPressButton(")");
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CalculatorButton(
                          widget: Text("1"),
                          method: () {
                            onPressButton("1");
                          }),
                      CalculatorButton(
                          widget: Text("2"),
                          method: () {
                            onPressButton("2");
                          }),
                      CalculatorButton(
                          widget: Text("3"),
                          method: () {
                            onPressButton("3");
                          }),
                      CalculatorButton(
                          widget: Text("-"),
                          method: () {
                            onPressButton("-");
                          }),
                      CalculatorButton(
                          widget: Text("Pow"),
                          method: () {
                            onPressButton("p");
                          }),
                      CalculatorButton(
                          widget: Text("Sqrt"),
                          method: () {
                            onPressButton("s");
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CalculatorButton(
                          widget: Text("0"),
                          method: () {
                            onPressButton("0");
                          }),
                      CalculatorButton(
                          widget: Text("."),
                          method: () {
                            onPressButton(".");
                          }),
                      CalculatorButton(
                          widget: Text("%"),
                          method: () {
                            onPressButton("%");
                          }),
                      CalculatorButton(
                          widget: Text("+"),
                          method: () {
                            onPressButton("+");
                          }),
                      CalculatorButton(
                          widget: Text("="),
                          method: () {
                            onPressButton("=");
                          },
                          flex: 2,
                          colorBoton: Colors.lightGreen),
                    ],
                  ),
                ],
              ),
              //color: Colors.green,
            )),
      ]),
    );
  }

  onPressButton(String text) {
    setState(() {
      //Se evaluan las opciones de C, Backspace
      switch (text) {
        case "c":
          expresion = '0';
          break;
        case "b":
          if (expresion.length >= 1) {
            expresion = expresion.substring(0, expresion.length - 1);
          }
          if (expresion.length == 0) {
            expresion = '0';
          }
          break;
        case "=":
          Parser p = Parser();
          try {
            Expression exp = p.parse(expresion);

            ContextModel cm = ContextModel();
            resultado = '${exp.evaluate(EvaluationType.REAL, cm)}';
          } catch (e) {
            resultado = "Error";
          }
          break;
        case "p":
          break;
        case "s":
          break;
        default:
          if (expresion == '0') {
            expresion = text;
          } else {
            expresion += text;
          }
      }
    });
  }
}
