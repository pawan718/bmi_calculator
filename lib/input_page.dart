import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results.dart';
import 'calculator_brain.dart';

const Bottomcontainerheight = 80.0;
const activecardcolor = Color(0xFF1D1F33);
const bottomcontainercolor = Color(0xFFEB1555);
const inactivecolour = Color(0xFF111328);
int height = 180;
int weight = 60;
int age = 12;

enum Gender { male, female }

class bmi extends StatefulWidget {
  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  Color malecardcolor = inactivecolour;
  Color femalecardcolor = inactivecolour;

  void updatecolor(Gender selcetedGender) {
    if (selcetedGender == Gender.male) {
      if (malecardcolor == inactivecolour) {
        malecardcolor = activecardcolor;
        femalecardcolor = inactivecolour;
      } else {
        malecardcolor = inactivecolour;
      }
    }
    if (selcetedGender == Gender.female) {
      if (femalecardcolor == inactivecolour) {
        femalecardcolor = activecardcolor;
        malecardcolor = inactivecolour;
      } else {
        femalecardcolor = inactivecolour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF090C22),
          title: Text('bmi calculator'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updatecolor(Gender.male);
                        });
                      },
                      child: Reusablecard(
                        cardchild: Iconcontent(
                          icon: FontAwesomeIcons.mars,
                          label: 'Male',
                        ),
                        colour: malecardcolor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updatecolor(Gender.female);
                        });
                      },
                      child: Reusablecard(
                        cardchild: Iconcontent(
                          icon: FontAwesomeIcons.venus,
                          label: 'Female',
                        ),
                        colour: femalecardcolor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Reusablecard(
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style:
                          TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 50.0),
                        ),
                        Text(
                          'cm',
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 250.0,
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });
                          }),
                    )
                  ],
                ),
                colour: activecardcolor,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Reusablecard(
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xFF8D8E98)),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              roundiconbutton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              roundiconbutton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              )
                            ],
                          )
                        ],
                      ),
                      colour: activecardcolor,
                    ),
                  ),
                  Expanded(
                    child: Reusablecard(
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xFF8D8E98)),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              roundiconbutton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 20.0,
                              ),
                              roundiconbutton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                      colour: activecardcolor,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Calculatorbrain calc =
                    Calculatorbrain(weight: weight, height: height);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Resultspage(
                            bmiresult: calc.Calculatebmi(),
                            interpretation: calc.getinterpretation(),
                            textresult: calc.getresult())));
              },
              child: Container(
                alignment: Alignment.center,
                color: bottomcontainercolor,
                margin: EdgeInsets.only(top: 15.0),
                width: double.infinity,
                height: Bottomcontainerheight,
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
                ),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
            ),
          ],
        ));
  }
}

class Iconcontent extends StatelessWidget {
  Iconcontent({required this.icon, required this.label});
  final IconData icon;
  String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}

class Reusablecard extends StatelessWidget {
  Reusablecard({required this.colour, required this.cardchild});
  Color colour;
  final Widget cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
    );
  }
}

class roundiconbutton extends StatelessWidget {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color(0xFF4C4F5E),
    minimumSize: Size(50, 50),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(40.0)),
    ),
  );
  roundiconbutton({required this.icon, required this.onPressed});
  final IconData icon;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed, style: flatButtonStyle, child: Icon(icon));
  }
}
