
import 'package:calc/constant/colors.dart';
import 'package:calc/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var userQuestion = "";
  var userAnswer = "";
  List<String> operator = [
    "mc",
    "m+",
    "m-",
    "mr",
    "c",
    "/",
    "*",
    "⌫",
    "+",
    "-",
    "%",
    ".",
    ",",
    "=",
  ];

  final List<String> button = [
    "mc",
    "m+",
    "m-",
    "mr",
    "c",
    "/",
    "*",
    "⌫",
    '7',
    "8",
    "9",
    "+",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "%",
    "0",
    ",",
    "=",
  ];

  void clear() {
    setState(() {
      userQuestion = "";
      userAnswer = "";
    });
  }

  void clearItem() {
    setState(() {
      userQuestion = userQuestion.substring(0, userQuestion.length - 1);
    });
  }


  // logic part
  void equalPresses() {
    try {
      String input = userQuestion;
      Parser parser = Parser();
      Expression expression = parser.parse(input);
      ContextModel contextModel = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);
      setState(() {
        userAnswer = eval.toString();
      });
    } catch (e) {
      setState(() {
        userAnswer = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //Display
            Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          userQuestion,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      if (userAnswer.isNotEmpty)
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            userAnswer,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w900),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                    ],
                  ),
                )),

            //Keyboard
            Expanded(
              flex: 2,
              child: Container(
                color: AppColors.bgColor,
                child: GridView.builder(
                  itemCount: button.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(5.0),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 1.1),
                  itemBuilder: (BuildContext context, int index) =>
                      itemsOfButton(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemsOfButton(int index) {
    if (index == 4) {
      // Clear button
      return CustomButton(
        onTap: () {
          clear();
        },
        isOperator: isOperator(button[index]),
        buttonText: button[index],
      );
    } else if (index == 5) {
      //   bo'lish button
      return CustomButton(
        onTap: () {
          setState(() {
            userQuestion += button[index];
          });
        },
        isOperator: isOperator(button[index]),
        buttonText: button[index],
      );
    } else if (index == 6) {
      //   ko'paytirish button
      return CustomButton(
        onTap: () {
          setState(() {
            userQuestion += button[index];
          });
        },
        isOperator: isOperator(button[index]),
        buttonText: button[index],
      );
    } else if (index == 7) {
      //   bittalab o'chirish button
      return CustomButton(
        onTap: () {
          setState(() {
            clearItem();
          });
        },
        isOperator: isOperator(button[index]),
        buttonText: button[index],
      );
    } else if (index == 11) {
      //   qo'shish button
      return CustomButton(
        onTap: () {
          setState(() {
            userQuestion += button[index];
          });
        },
        isOperator: isOperator(button[index]),
        buttonText: button[index],
      );
    } else if (index == 15) {
      //   ayrish button
      return CustomButton(
        onTap: () {
          setState(() {
            userQuestion += button[index];
          });
        },
        isOperator: isOperator(button[index]),
        buttonText: button[index],
      );
    } else if (index == 19) {
      //   foyiz button
      return CustomButton(
        onTap: () {
          setState(() {
            userQuestion += button[index];
          });
        },
        isOperator: isOperator(button[index]),
        buttonText: button[index],
      );
    } else if (index == 21) {
      //   vergul button
      return CustomButton(
        onTap: () {
          setState(() {
            userQuestion += button[index];
          });
        },
        isOperator: isOperator(button[index]),
        buttonText: button[index],
      );
    } else if (index == 22) {
      //   barobar button
      return CustomButton(
        onTap: () {
          setState(() {
            equalPresses();
          });
        },
        isOperator: isOperator(button[index]),
        buttonText: button[index],
      );
    }

    return CustomButton(
      onTap: () {
        setState(() {
          userQuestion += button[index];
        });
      },
      isOperator: isOperator(button[index]),
      buttonText: button[index],
    );
  }

  bool isOperator(String x) {
    if (operator.contains(x)) {
      return true;
    }
    return false;
  }
}
