import 'package:flutter/material.dart';
import 'package:mustafa/My_pro.dart';

class Card_Proposals extends StatelessWidget {
final String name;
final String type;
final String price;
final Widget widget;

  const Card_Proposals({super.key, required this.name, required this.type, required this.price, required this.widget});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: full,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black38,offset: Offset(0,0),blurRadius: 10)],
          border: Border.all(color: co1, width: 2)),
      child: Column(
        children: [
          Row(
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
                        child: Center(
                          child: Text(
                            name,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      Positioned(
                          top: -8,
                          right: 17,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            color: Colors.white,
                            child: const Center(
                              child: Text(
                                "أسم الوريث",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
              Spacer(),
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
                        child: Center(
                          child: Text(
                          type,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Positioned(
                          top: -8,
                          right: 17,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            color: Colors.white,
                            child: const Center(
                              child: Text(
                                "صله القرأبه",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          Container(
            width: full,
            decoration: BoxDecoration(border: Border.all(color: co1,width: 2)),
            alignment: Alignment.center,
            child: Text(
              "الاصوال",
              style: TextStyle(
                  fontSize: 25, color: co1, fontWeight: FontWeight.bold),
            ),
          ),
          Row(children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: co1,width: 2)),
                alignment: Alignment.center,
                child: Text(
                  "اسم الاصل",
                  style: TextStyle(
                      fontSize: 25, color: co1, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: co1,width: 2)),
                alignment: Alignment.center,
                child: Text(
                  "قيمه الاصل",
                  style: TextStyle(
                      fontSize: 25, color: co1, fontWeight: FontWeight.bold),
                ),
              ),
            ),

          ],),
          widget
          // ListView.builder(itemBuilder: itemBuilder)
        ],
      ),
    );
  }
}
