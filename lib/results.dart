import 'package:flutter/material.dart';
import 'input_page.dart';
import 'main.dart';

class Resultspage extends StatelessWidget {
  Resultspage({required this.bmiresult,required this.interpretation,required this.textresult});

  final String bmiresult;
  final String textresult;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Text(
                  'Your Results',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Reusablecard(
                    colour: activecardcolor,
                    cardchild: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(textresult.toUpperCase(), style: TextStyle(color: Color(0xFF24D876), fontSize: 22.0, fontWeight: FontWeight.bold),),
                        Text(
                          bmiresult,
                          style: TextStyle(
                              fontSize: 100.0, fontWeight: FontWeight.bold),
                        ),
                        Text(interpretation.toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontSize: 22.0,),),



                      ],
                    ))),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);

              },
              child: Container(
                alignment: Alignment.center,
                color: bottomcontainercolor,
                margin: EdgeInsets.only(top: 15.0),
                width: double.infinity,
                height: Bottomcontainerheight,
                child: Text(
                  'Re-Calculate',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ],
        ));
  }
}
