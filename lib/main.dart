import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(bmicalculator());
}

class bmicalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF090C22),
        primaryColor: Color(0xFF090C22),
      ),
      home: bmi(),
    );
  }
}

