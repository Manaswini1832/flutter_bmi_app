import 'package:flutter/material.dart';

import 'constants.dart';

class CardWithIconAndText extends StatelessWidget {
  final IconData iconName;
  final String label;

  CardWithIconAndText(this.iconName, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 50.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(label, style: kLabelTextStyle),
      ],
    );
  }
}
