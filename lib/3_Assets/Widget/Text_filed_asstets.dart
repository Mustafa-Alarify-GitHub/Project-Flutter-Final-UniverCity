import 'package:flutter/material.dart';
import 'package:mustafa/My_pro.dart';

class TextFiledAssets extends StatelessWidget {
  final TextEditingController Controller;
  final TextInputType KeyboardType;
  final String Labl;

  const TextFiledAssets(
      {super.key,
      required this.Controller,
      required this.KeyboardType,
      required this.Labl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        textAlign: TextAlign.start,
        controller: Controller,
        keyboardType: KeyboardType,
        decoration: InputDecoration(
            labelText: Labl,
            labelStyle: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: co1),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(horizontal: 50),
            fillColor: const Color.fromRGBO(44, 78, 103, .15),
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
