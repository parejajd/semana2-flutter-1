import 'package:flutter/material.dart';

Widget CalculatorButton(
    {required Widget widget,
    required dynamic method,
    int flex = 1,
    dynamic colorBoton = Colors.grey}) {
  return Expanded(
    flex: flex,
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: colorBoton,
          ),
          onPressed: method,
          child: widget,
          autofocus: false,
        ),
      ),
    ),
  );
}
