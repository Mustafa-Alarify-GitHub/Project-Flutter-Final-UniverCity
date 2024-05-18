import 'package:flutter/material.dart';
import 'package:mustafa/My_pro.dart';

class Card_Ruslt extends StatelessWidget {
final String name;
final String price;
final String type;
final String N;

  const Card_Ruslt({super.key, required this.name, required this.price, required this.type, required this.N});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.all(8),
      width: full,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.black54),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                Container(
                  width: 240,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(width: 2, color: Colors.black54),
                  ),
                  child:Center(child: Text("$name",style: TextStyle(fontSize: 25),),) ,

                ),
                Positioned(
                    top: -8,
                    right: 17,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      color: Colors.white,
                      child: Center(
                        child: Text("أسم الوريث",style: TextStyle(fontSize: 17),),
                      ),
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  width: 240,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(width: 2, color: Colors.black54),
                  ),
                  child:Center(child: Text("$price",style: TextStyle(fontSize: 25),),) ,

                ),                Positioned(
                    top: -8,
                    right: 17,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      color: Colors.white,
                      child: Center(
                        child: Text("ألحصه",style: TextStyle(fontSize: 17),),
                      ),
                    ))
              ],
            ),


          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                Container(
                  width: 130,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(width: 2, color: Colors.black54),
                  ),
                  child:Center(child: Text("$type",style: TextStyle(fontSize: 18),),) ,

                ),
                Positioned(
                    top: -8,
                    right: 17,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      color: Colors.white,
                      child: Center(
                        child: Text("صله القرأبه",style: TextStyle(fontSize: 15),),
                      ),
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  width: 130,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(width: 2, color: Colors.black54),
                  ),
                  child:Center(child: Text("$N% ",style: TextStyle(fontSize: 25),),) ,

                ),
                Positioned(
                    top: -8,
                    right: 17,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.white,
                      child: Center(
                        child: Text("النسبه",style: TextStyle(fontSize: 15),),
                      ),
                    ))
              ],
            ),

          ],
        ),
      ]),
    );
  }
}
