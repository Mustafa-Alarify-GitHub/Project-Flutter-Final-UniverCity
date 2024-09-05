 import 'package:flutter/material.dart';
import 'package:mustafa/2_Home/About%20us.dart';
import 'package:mustafa/2_Home/MazhabZaidiPage.dart';
import 'package:mustafa/My_pro.dart';

 import 'Home.dart';

class mainScreen extends StatefulWidget {
  @override
  State<mainScreen> createState() => _mainScreenState();
}
// About()
class _mainScreenState extends State<mainScreen> {
  var index_page = 1;
  List<Widget> pages = [About(),Home(), MazhabZaidiPage() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("images/About.png",width: index_page == 0 ? 55 : 35),
                label: "About", tooltip: "About Us"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home,size: index_page ==1 ? 40 : 25,),
                label: "Home", tooltip: "Home"),
            BottomNavigationBarItem(
                icon: Image.asset("images/aa.png",width: index_page == 2? 55 : 35,),
                label: "Mazhab", tooltip: "MazhabZaidi"),
          ],
          currentIndex: index_page,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          backgroundColor: co1,
          onTap: (val) {
            setState(() {
              index_page = val as int;
            });
          }),
      body: pages.elementAt(index_page),
    );
  }
}
