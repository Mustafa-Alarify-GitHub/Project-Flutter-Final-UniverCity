import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustafa/4_Inheritance/Widget/Widget%20DropDown.dart';
import '../My_pro.dart';
import 'Controller_inheritance.dart';

class Main_inheritance extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Controller_inheritance controller = Get.put(Controller_inheritance());
    controller.Get_Data();
    return Scaffold(
      appBar: AppBar(
        title: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Image.asset("images/icon.png")),
        centerTitle: true,
        backgroundColor: co1,
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            width: full,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 300,
                    child: Text_Field(
                        controller.name, TextInputType.name, "أسم الوريث", 1)),
                DropdownButtonExample(),
              ],
            ),
          ),
          btn("اضافة", co2, 22, true, () {
            controller.Add_Data();
            controller.name.text = "";
          }),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 3,
            color: co1,
            thickness: 5,
            indent: 15,
            endIndent: 15,
          ),
          Expanded(
              child: Container(
            child: GetBuilder(
                init: Controller_inheritance(),
                builder: (con) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    //controller.data.length,
                    itemBuilder: (context, index) {
                      return controller.data.length > 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 270,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 2,
                                        color: co1,
                                      )),
                                  child: Center(
                                      child: txt(
                                          "${controller.data[index]["Inh_name"]}",
                                          co1,
                                          30,
                                          true)),
                                ),
                                Container(
                                  width: 110,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 8),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 2,
                                        color: co1,
                                      )),
                                  child: Center(
                                      child: txt(
                                          "${controller.data[index]["type"]}",
                                          co1,
                                          17,
                                          true)),
                                )
                              ],
                            )
                          : txt("لأيوجد بيانات", Colors.grey[900], 25, false);
                    })),
          )),
          btn("تقسيم", co2, 22, true, () {
            controller.Move_Scand_page();
          }),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
