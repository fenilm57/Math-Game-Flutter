import 'package:flutter/material.dart';

import '../const.dart';

class MyButton extends StatelessWidget {
  final String text;
  var buttonColor = Colors.deepPurple[400];
  final VoidCallback onTap;

  MyButton({Key? key, required this.text, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (text == 'C') {
      buttonColor = Colors.green;
    } else if (text == 'DEL') {
      buttonColor = Colors.red;
    } else if (text == '=') {
      buttonColor = Colors.deepPurple;
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: whiteTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
