import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_game/const.dart';
import 'package:math_game/utils/my_button.dart';
import 'package:math_game/utils/result_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userAnswer = '';

  List<String> numberpad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
  ];
  int number1 = 1;
  int number2 = 1;
  void buttonTapped(String text) {
    setState(
      () {
        if (text == 'C') {
          userAnswer = '';
        } else if (text == 'DEL') {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        } else if (text == '=') {
          checkAnswer();
        } else if (userAnswer.length < 3) {
          userAnswer += text;
        }
      },
    );
  }

  void checkAnswer() {
    if (int.parse(userAnswer) == number1 + number2) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultDialog(
                onTap: goToNextQuestion,
                message: "Correct!",
                icon: Icons.arrow_forward);
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultDialog(
              onTap: repeatQuestion,
              message: "Sorry, Try Again",
              icon: Icons.arrow_back_outlined,
            );
          });
    }
  }

  void repeatQuestion() {
    Navigator.pop(context);
  }

  var randomNumber = Random();

  void goToNextQuestion() {
    Navigator.pop(context);
    setState(() {
      userAnswer = '';
    });

    number1 = randomNumber.nextInt(10);
    number2 = randomNumber.nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          Container(
            height: 160,
            color: Colors.deepPurple,
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$number1 + $number2 = ',
                    style: whiteTextStyle,
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                    ),
                    child: Center(
                      child: Text(
                        userAnswer,
                        style: whiteTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: numberpad.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    text: numberpad[index],
                    onTap: () => buttonTapped(numberpad[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
