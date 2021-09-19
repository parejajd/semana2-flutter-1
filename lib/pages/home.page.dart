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
  String error = '';
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
              color: Colors.grey,
              child: Text(
                resultado,
                style: TextStyle(
                  fontSize: resultado.length > 15 ? 20 : 38,
                ),
              ),
              //color: Colors.blue,
            )),
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              color: Colors.black87,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Column(
                children: [
                  Text(
                    expresion,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: expresion.length > 15 ? 20 : 38,
                    ),
                  ),
                  Text(
                    error,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              //color: Colors.red,
            )),
        Expanded(flex: 2, child: _buttons()),
      ]),
    );
  }

  _buttons() {
    return Container(
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
                  widget: Text("x^y"),
                  method: () {
                    onPressButton("p");
                  }),
              CalculatorButton(
                  widget: Text("√"),
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
    );
  }

  onPressButton(String text) {
    setState(() {
      error = '';
      //Se evaluan las opciones de C, Backspace
      switch (text) {
        case "c":
          expresion = '0';
          resultado = '_';
          error = '';
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
            if (expresion.contains('√')) {
              expresion = expresion.replaceAll('√', 'sqrt');
            }
            Expression exp = p.parse(expresion);
            resultado = expresion;
            ContextModel cm = ContextModel();
            expresion = '${exp.evaluate(EvaluationType.REAL, cm)}';

            //Simplemente por presentación se quita el .0
            if (expresion.endsWith('.0')) {
              expresion = expresion.substring(0, expresion.length - 2);
            }

            if (resultado.contains('sqrt')) {
              resultado = resultado.replaceAll('sqrt', '√');
            }
          } on FormatException {
            error = "Error en el formato de la expresión matemática";
          } on Exception catch (e) {
            error = "Error no especificado $e";
          } catch (e) {
            error = "Error en el formato de la expresión matemática";
          }
          break;
        case "p":
          if (expresion == '0') {
            expresion = "0^";
            error = '¿En serio? 0 a cualquier potencia, siempre es cero';
          } else {
            expresion = expresion + "^";

            error = 'Ingrese la potencia';
          }
          break;
        case "s":
          if (expresion == '0') {
            expresion = "√0";
            error = '¿En serio? La raiz de 0 siempre es cero';
          } else {
            expresion = expresion + "√(";
            error = 'Ingrese una expresión y termine con )';
          }

          break;
        case "%":
          //Recorrer la expresion y obtener los ultimos numeros
          String ultimo = '';
          int posicion = 0;
          for (int i = expresion.length - 1; i >= 0; i--) {
            //Determina si es un numero
            if (double.tryParse(expresion[i]) != null || expresion[i] == '.') {
              ultimo = expresion[i] + ultimo;
            } else {
              posicion = i;
              break;
            }
          }
          double porcentaje = double.parse(ultimo) / 100;

          if (posicion == 0) {
            expresion = '$porcentaje';
          } else {
            expresion =
                expresion.substring(0, posicion + 1) + porcentaje.toString();
          }

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
