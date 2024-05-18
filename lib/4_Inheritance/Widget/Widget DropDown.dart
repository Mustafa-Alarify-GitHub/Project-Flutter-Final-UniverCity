import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustafa/My_pro.dart';
import '../Controller_inheritance.dart';

const List<String> list_DropDown = <String>[
  'ام',
  'اب',
  'جد',
  'جده',
  'ابن',
  'بنت',
  // 'ابن الأبن',
  // 'بنت الأبن',
  // 'أخ شقيق',
  // 'أخت شقيقه',
  // 'أخ لأب',
  // 'أخت لأب',
  // 'أخ او خت لأم',
  // 'أبن أخ شقيق',
  // 'أبن أخ لأب',
  // 'عم شقيق',
  // 'عم لأب',
  // 'أبن عم شقيق',
  // 'أبن عم لأب',
  'زوج',
  'زوجه'
];
Controller_inheritance controller = Get.put(Controller_inheritance());



class DropdownButtonExample extends StatefulWidget {


  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  EventSelect(value) {
    controller.type=value;
    print("${controller.type}");
  }
  String name_DropDown = list_DropDown.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: name_DropDown,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style:  TextStyle(color: co1,fontSize: 15,fontWeight: FontWeight.bold),
      underline: Container(
        height: 5,
        color: co1,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          name_DropDown = value!;
          EventSelect(value);
        });
      },
      items: list_DropDown.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
