import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/Model/button_list.dart';
import 'package:math_expressions/math_expressions.dart';

class ModelBtn extends GetxController {
  RxString input = '0'.obs;
  RxString output = '0'.obs;
  // Parser p = Parser();
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

  void theOperations(int index, List<String> btnList) {
    if (index == 0) {
      //Clear
      input.value = '0';
      output.value = '0';
    } else if (index == 1) {
      if (input.value.isEmpty) {
        return null;
      }
      input.value = input.substring(0, input.value.length - 1);
    }
    // else if (index == myList.length - 1) {
    // input.value = input.value.replaceAll('X', '*');
    // input.value = input.value.replaceAll('√', 'sqrt');

    // // String outPutVar =
    // Parser p = Parser();
    // Expression exp = p.parse(input.value);
    // ContextModel cm = ContextModel();
    // double eval = exp.evaluate(EvaluationType.REAL, cm);

    // output.value = eval.toString();
    // }
    else {
      // input.value += btnList[index];
      addInInput(btnList[index]);
      replaceInInput(btnList[index]);
    }
  }

  bool isOperator(String x) {
    if (x == '%' ||
        x == '/' ||
        x == 'X' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == '√') {
      return true;
    }
    return false;
  }

  void addInInput(String value) {
    if (input.value == '0' && myOperators.contains(value)) {
      input.value = 'aaa $value';
    }
  }

  void replaceInInput(String value) {
    if (myOperators.contains(input.value)) {
      input.value = value;
    }
  }
}

//

// void onPress(int index, List<String> btnList) {
//   input.value += btnList[index];
// }

// void clearFunc(int index, List<String> btnList) {
//   input.value = '';
//   output.value = '';
// }

// void delFunc(int index, List<String> btnList) {
//   if (input.value.isEmpty) {
//     return null;
//   }
//   input.value = input.substring(0, input.value.length - 1);
// }
