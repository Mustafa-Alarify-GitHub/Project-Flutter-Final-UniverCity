import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustafa/API/Api.dart';
import 'package:mustafa/API/Links.dart';
import 'package:mustafa/SherdRefrance/shared_preferences.dart';
import 'package:mustafa/SqlFlite/sqlDB+ALL.dart';
import '../5_Rusults/Ruesult.dart';
import '../My_pro.dart';

class Controller_inheritance extends GetxController {

  List data = [];
  bool loding = true;
  String type = "ام";
  TextEditingController name = TextEditingController();

  Get_Data() async {
    data.clear();
    var ruslt = await Api.postData(
        LinkApp.get_Data_Inheritance, {"id": "${Get.arguments}"});
    print(ruslt["data"]);
    if (ruslt["status"] == "true") {
      data.addAll(ruslt["data"]);
      update();
    }
  }

  Add_Data() async {
    if (name.text != "") {

      var ruslt = await Api.postData(LinkApp.Add_Inheritance, {
        "Inh_name": name.text,
        "Inh_name_death": "${Get.arguments}",
        "type": "$type"
      });
      if (ruslt["status"] == "true") {
        Get_Data();
        update();
      }
    } else {
      Get.snackbar("تنبيه", "أدخل البيانات اولآ",
          backgroundColor: Colors.grey, colorText: co2);
    }
  }

  sqlDb Sql = sqlDb();

  Move_Scand_page() async {
    var nameDE=await shared.getData(shared.key_Name);
    await Sql.insert_plus('Inheritance', {'name': "$nameDE"});
    Get.to(() => Result(
          data: data,
        ));
  }
}
