import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/Model/button_list.dart';

class ModelBtn extends GetxController {
  RxString input = ''.obs;
  RxString output = ''.obs;
  RxList<String> splittedList = [''].obs;
  String operator = '';

  final myList = btnList;
  final myOperators = operatorList;

  dynamic colorCondition(
    int index,
  ) {
    if (index == 0) {
      return Colors.red;
    } else if (index == 1) {
      return Colors.green;
    } else {
      return Colors.blue;
    }
  }

  void operations(int index, List<String> btnList) {
    if (index == 0) {
      //Clear
      input.value = '';
      output.value = '';
    } else if (index == 1) {
      if (input.value.isEmpty) {
        return null;
      }
      input.value = input.substring(0, input.value.length - 1);
    } else if (index == myList.length - 1) {
      isOperatorExist(input.value, splittedList);
      output.value = output.value;
    } else {
      updateOperatorInInput(myList[index]);
    }
  }

  void updateOperatorInInput(String value) {
    String lastCharacter =
        input.isNotEmpty ? input.substring(input.value.length - 1) : '';

    if (myOperators.contains(lastCharacter) && myOperators.contains(value)) {
      input.value = input.value
          .replaceRange(input.value.length - 1, input.value.length, '');
    }
    input.value += value;
  }

  bool isOperatorExist(String value, List<String> newList) {
    for (String currentOperator in myOperators) {
      if (value.contains(currentOperator)) {
        newList = value.split(currentOperator);

        String part1 = newList[0];
        String part2 = newList[1];

        double num1 = double.parse(part1);
        double num2 = double.parse(part2);

        switch (currentOperator) {
          case "+":
            output.value = (num1 + num2).toString();
            break;
          case "-":
            output.value = (num1 - num2).toString();
            break;
          case "X":
            output.value = (num1 * num2).toString();
            break;
          case "/":
            output.value = (num1 / num2).toString();
            break;
          case "%":
            output.value = {double.parse(newList[0]) / 100}.toString();
            break;
        }
      }
    }
    return false;
  }
}
    






  // bool isOperator(String x) {
  //   if (x == '%' ||
  //       x == '/' ||
  //       x == 'X' ||
  //       x == '-' ||
  //       x == '+' ||
  //       x == '=' ||
  //       x == '√') {
  //     return true;
  //   }
  //   return false;
  // }