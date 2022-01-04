import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reusableContainerCard.dart';
import 'cardWithIconAndText.dart';
import 'bottomBar.dart';
import 'constants.dart';
import 'bmiCalculator.dart';

enum Gender { none, male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int height = 180;
  int weight = 30;
  int age = 19;

  void increaseAge() {
    setState(() {
      age++;
    });
  }

  void decreaseAge() {
    setState(() {
      if (age >= 2) {
        age--;
      }
    });
  }

  void increaseWeight() {
    setState(() {
      weight++;
    });
  }

  void decreaseWeight() {
    setState(() {
      if (weight >= 4) {
        weight--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: kAppBarTextStyle,
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        child: ReusableContainerCard(
                          selectedGender == Gender.male
                              ? Color(kActiveCardColor)
                              : Color(kInactiveCardColor),
                          CardWithIconAndText(
                            FontAwesomeIcons.mars,
                            'MALE',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        child: ReusableContainerCard(
                          selectedGender == Gender.female
                              ? Color(kActiveCardColor)
                              : Color(kInactiveCardColor),
                          CardWithIconAndText(
                            FontAwesomeIcons.venus,
                            'FEMALE',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableContainerCard(
                  Color(kActiveCardColor),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberLabelTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color(0xFFFFFFFF),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          overlayColor: Color(0x29EB1555),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ReusableContainerCard(
                        Color(kActiveCardColor),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: [
                                Text(
                                  weight.toString(),
                                  style: kNumberLabelTextStyle,
                                ),
                                Text('kg', style: kLabelTextStyle),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomIconButton(
                                  Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                  decreaseWeight,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                CustomIconButton(
                                  Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                  increaseWeight,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: ReusableContainerCard(
                          Color(kActiveCardColor),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: kLabelTextStyle,
                              ),
                              SizedBox(height: 5.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                textBaseline: TextBaseline.alphabetic,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: [
                                  Text(
                                    age.toString(),
                                    style: kNumberLabelTextStyle,
                                  ),
                                  Text('yrs', style: kLabelTextStyle),
                                ],
                              ),
                              SizedBox(height: 5.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomIconButton(
                                    Icon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.white,
                                    ),
                                    decreaseAge,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  CustomIconButton(
                                    Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.white,
                                    ),
                                    increaseAge,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              BottomBar(
                  text: 'CALCULATE',
                  onTapFunction: () {
                    BmiCalculator bmiCalculator = BmiCalculator(height, weight);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                            bmiCalculator.calculateBMI(),
                            bmiCalculator.getResult(),
                            bmiCalculator.getInterpretation()),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Icon iconToAdd;
  final VoidCallback functionToImplement;

  CustomIconButton(this.iconToAdd, this.functionToImplement);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: functionToImplement,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: iconToAdd,
      elevation: 6.0,
    );
  }
}
