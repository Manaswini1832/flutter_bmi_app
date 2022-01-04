import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottomBar.dart';
import 'bmiCalculator.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String result;
  final String interpretation;

  ResultsPage(this.bmiResult, this.result, this.interpretation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: kAppBarTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Your Result',
              style: kResultTitleTextStyle,
            ),
            margin: EdgeInsets.all(15.0),
          ),
          Expanded(
            child: Container(
              color: Color(0xFF1D1E33),
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            result,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 19.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bmiResult,
                            style: TextStyle(
                              fontSize: 70.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              interpretation,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomBar(
              text: 'RE-CALCULATE',
              onTapFunction: () {
                Navigator.pop(context, '/');
              }),
        ],
      ),
    );
  }
}
