import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../My_pro.dart';
import '../2_Home/mainScreen.dart';

class Loding extends StatefulWidget {
  @override
  State<Loding> createState() => _LodingState();
}

class _LodingState extends State<Loding> {
  void wait() async {
    await Future.delayed(Duration(milliseconds: 1200));
    Get.off(()=>mainScreen());
  }

  @override
  void initState() {
    wait();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: full,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/icon.png"),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: co1,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            txt("جاري التحميل...", co1, 25, true),
          ],
        ),
      ),
    );
  }
}
