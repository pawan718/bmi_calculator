
import 'dart:math';

import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

class Calculatorbrain{

  Calculatorbrain({required this.height, required this.weight,});
  final int height;
  final int weight;
  double bmi=0;

  String Calculatebmi() {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }
  String getresult() {
    if ( bmi >= 25) {
      return 'overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'underweight';
    }
  }

  String getinterpretation() {
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. try to explore more';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}