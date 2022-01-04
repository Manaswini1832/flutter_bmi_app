import 'package:flutter/material.dart';
import 'constants.dart';

class BottomBar extends StatelessWidget {
  final String text;
  final VoidCallback onTapFunction;

  BottomBar({required this.text, required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(kBottomContainerColor),
      height: kBottomContainerHeight,
      width: double.infinity,
      child: GestureDetector(
        onTap: onTapFunction,
        child: Center(
          child: Text(text, style: kBottomContainerTextStyle),
        ),
      ),
    );
  }
}
