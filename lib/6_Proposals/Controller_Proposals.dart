import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustafa/2_Home/mainScreen.dart';
import 'package:mustafa/API/Api.dart';
import 'package:mustafa/API/Links.dart';
import 'package:mustafa/SherdRefrance/shared_preferences.dart';
import '../My_pro.dart';
import 'Widget/PDF.dart';

class Controller_Proposals extends GetxController {
  bool lodding = true;
  List data_In = [];
  List data_Items = [];
  int index_Get_Name_Inh = 0;
  Map map_PDF = {};

  Get_Items() async {
    var id = await shared.getData(shared.key_ID);
    var res = await Api.postData(LinkApp.get_Items, {"name": "$id"});

    data_Items.addAll(res["data"]);
    print(data_Items);
    lodding = false;
    update();
  }

  List item_Name = [];
  List item_Price = [];
  List item_BookedUp = [];

  var random = Random();

  Loop_Items(data_Items, price) {
    item_Name.clear();
    item_Price.clear();

    Find_In_List_item_BookedUp(value) {
      if (item_BookedUp.length == 0) {
        return true;
      } else {
        for (int i = 0; i < item_BookedUp.length; i++) {
          if (value == item_BookedUp[i]) {
            return false;
          }
        }
      }
      return true;
    }

    for (int i = 0; i < data_Items.length; i++) {
      if (double.parse(data_Items[i]['item_price']) <= price &&
          Find_In_List_item_BookedUp(data_Items[i]['item_name'])) {
        item_Name.add(data_Items[i]["item_name"]);
        item_Price.add(data_Items[i]["item_price"]);
      }
    }
  }

  Get_one_items(price, context) {
    Loop_Items(data_Items, price);

    List item_Name_In = [];
    List item_Price_In = [];

    for (int i = 0; i < item_Name.length; i++) {
      int index_Random = random.nextInt(item_Name.length);

      var value_Booked = item_Name[index_Random];
      bool can_Take = true;

      for (int x = 0; x < item_BookedUp.length; x++) {
        if (value_Booked == item_BookedUp[x]) {
          can_Take = false;
        } else {
          can_Take = true;
        }
      }
      if (can_Take && price >= double.parse(item_Price[index_Random])) {
        price -= double.parse(item_Price[index_Random]);
        item_Name_In.add(item_Name[index_Random]);
        item_Price_In.add(item_Price[index_Random]);
        item_BookedUp.add(item_Name[index_Random]);
      }
    }

    map_PDF[index_Get_Name_Inh] = {
      "name_In": "${data_In[index_Get_Name_Inh]["Inh_name"]}",
      "type": "${data_In[index_Get_Name_Inh]["type"]}",
      "name_i": item_Name_In,
      "price_i": item_Price_In,
      "totle_price": price,
    };


    if (index_Get_Name_Inh != data_In.length-1) {
      index_Get_Name_Inh++;
    }
    return Column(
      children: [
        ...List.generate(
            item_Price_In.length,
            (index) => Row(
                  children: [
                    Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "${item_Name_In[index]}",
                              style: TextStyle(fontSize: 18),
                            ))),
                    Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "${item_Price_In[index]}",
                              style: TextStyle(fontSize: 18),
                            ))),
                  ],
                )),
        Divider(
          color: co1,
          height: 2,
          endIndent: 10,
          indent: 10,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "المبلغ المتبقي",
                      style: TextStyle(fontSize: 18),
                    ))),
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${price.toString().length > 5 ? price.toString().substring(0, 5) : price}",
                      style: TextStyle(fontSize: 20),
                    ))),
          ],
        ),

      ],
    );
  }

  Get_Data_Inheritance() async {
    var id = await shared.getData(shared.key_ID);
    data_In.clear();
    var res = await Api.postData(LinkApp.get_Data_Inheritance, {"id": '$id'});

    if (res["status"] == "true") {
      data_In.addAll(res["data"]);
    }
  }

  Updata_Page() {
    index_Get_Name_Inh = 0;
    map_PDF.clear();
    item_BookedUp.clear();
    update();
  }

  Print_PDF() async {

    PDF.Get_NameDe(map_PDF,data_Items);
   await PDF.createPdf();
   Get.offAll(()=>mainScreen());
  }
}
