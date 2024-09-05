import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color co1 = Color.fromRGBO(44, 78, 103, 1);
Color co2 = Color.fromRGBO(217, 220, 225, 1);

double full = double.infinity;

Widget txt(txt_, color_, double fontSize_, bool isFontWeight) {
  return Text(txt_,
      style: TextStyle(
          color: color_,
          fontSize: fontSize_,
          fontWeight:
              isFontWeight == true ? FontWeight.bold : FontWeight.normal));
}

bool pass = true;
IconData? icontf = Icons.visibility_off;

Widget btn(txt_, color_, double fontSize_, isFontWeight, fun()) {
  return MaterialButton(
    onPressed: fun,
    child: Container(
      margin: EdgeInsets.all(10),
      width: 250,
      height: 55,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black26, offset: Offset(0, 10), blurRadius: 10)
      ], borderRadius: BorderRadius.circular(35), color: co1),
      child: Center(child: txt(txt_, color_, fontSize_, isFontWeight)),
    ),
  );
}

//
Widget Text_Field(controller_, keyboardType_, labelText, maxLines) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
    child: TextField(
        controller: controller_,
        maxLines: maxLines,
        keyboardType: keyboardType_,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: co1, fontSize: 30),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50), gapPadding: 10),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50), gapPadding: 10))),
  );
}

Widget myApper() {
  return Container(
    height: 70,
    color: co1,
    width: full,
    margin: EdgeInsets.only(bottom: 30),
    child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: Image.asset("images/icon.png")),
  );
}

Widget myApper2(txt1_) {
  return Container(
    child:Text(txt1_,  style: TextStyle(
        fontSize:25 ,
        fontWeight:
        FontWeight.bold ),textAlign: TextAlign.center,),
  );
}

Widget btn_2(txt_, fun()) {
  return MaterialButton(
    onPressed: fun,
    child: Container(
      width: 80,
      height: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(35), color: co1),
      child: Center(child: txt(txt_, Colors.white, 25, false)),
    ),
  );
}

//
Widget Text_Field_2(
  controller_,
  labelText,
) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
    child: TextField(
        controller: controller_,
        decoration: InputDecoration(
            enabled: false,
            labelText: labelText,
            labelStyle: TextStyle(color: co1, fontSize: 30),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50), gapPadding: 10),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50), gapPadding: 10))),
  );
}
