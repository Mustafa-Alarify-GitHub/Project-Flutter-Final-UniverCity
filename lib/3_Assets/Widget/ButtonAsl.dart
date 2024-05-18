import 'package:flutter/material.dart';

import '../../My_pro.dart';

class ButtonAsl extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onTap;

  const ButtonAsl(
      {super.key,
      required this.text,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child:  txt(text, Colors.white, 22, true),
      ),
    );
  }
}
