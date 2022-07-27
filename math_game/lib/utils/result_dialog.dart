import 'package:flutter/material.dart';

import '../const.dart';

class ResultDialog extends StatelessWidget {
  final VoidCallback onTap;
  final String message;
  final IconData icon;
  const ResultDialog(
      {Key? key,
      required this.onTap,
      required this.message,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              message,
              style: whiteTextStyle,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[300],
                borderRadius: BorderRadius.circular(4),
              ),
              child: GestureDetector(
                onTap: onTap,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
