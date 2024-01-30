import 'package:bmicalculator/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BmiCalculator(),
      ),
    ),
  );
}
