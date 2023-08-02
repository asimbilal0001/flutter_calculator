import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/Controller/button_controller.dart';
import 'package:my_calculator/Views/widgets/buttons.dart';
import 'package:my_calculator/Utils/app_strings.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  final c = Get.put(ModelBtn());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(child: Text(displayTitle)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          alignment: Alignment.centerRight,
                          child: Obx(
                            () => Text(
                              c.input.value,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Obx(
                            () => Text(
                              c.output.value,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: c.myList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: CalButton(
                          buttonTapped: () {
                            c.theOperations(index, c.myList);
                            
                          },
                          btnColor: c.colorCondition(index),
                          btnText: c.myList[index],
                          textColor: Colors.white,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void eqlFunc() {
  //   c.input.value = c.input.value.replaceAll('X', '*');
  //   c.input.value = c.input.value.replaceAll('√', 'sqrt');

  //   // String outPutVar =
  //   Parser p = Parser();
  //   Expression exp = p.parse(c.input.value);
  //   ContextModel cm = ContextModel();
  //   double eval = exp.evaluate(EvaluationType.REAL, cm);

  //   c.output.value = eval.toString();
  // }
}
