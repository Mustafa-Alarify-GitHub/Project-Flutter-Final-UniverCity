import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustafa/3_Assets/Pages/Add_Assets.dart';
import 'package:mustafa/4_Inheritance/Main_Inheritance.dart';
import 'package:mustafa/API/Api.dart';
import 'package:mustafa/API/Links.dart';
import 'package:mustafa/SherdRefrance/shared_preferences.dart';
import '../../My_pro.dart';

class MainAssts extends StatefulWidget {
  final String name_Death;

  const MainAssts({super.key, required this.name_Death});

  @override
  State<MainAssts> createState() => _MainAsstsState();
}

class _MainAsstsState extends State<MainAssts> {
  List data = [];
  int id = 0;
  bool loding = true;

  Get_ID_Death() async {
    var ruspones =
        await Api.postData(LinkApp.get_ID, {"name": "${widget.name_Death}"});
    id = int.parse(ruspones["data"][0]["death_id"]);
    await shared.setData(shared.key_ID, ruspones["data"][0]["death_id"]);
    await Get_Items();
  }

  Get_Items() async {
    data.clear();
    loding = true;
    var ruspones = await Api.postData(LinkApp.get_Items, {"name": "$id"});
    print(ruspones);
    if (ruspones["status"] == "true") {
      data.addAll(ruspones["data"]);
    }
    loding = false;
    setState(() {});
  }

  @override
  void initState() {
    Get_ID_Death();


  }

  Widget build(BuildContext context) {
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
      body: loding
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Color.fromRGBO(211, 211, 211, 1),
                        child: Center(
                          child: txt("الآصول ", co1, 30, false),
                        ),
                      ),
                      /****************** Title *******************/
                      Table(
                        border: TableBorder.all(color: co1, width: 2),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(children: [
                            Center(child: txt("أسم الأصل", co1, 22, true)),
                            Center(child: txt("القيمة ", co1, 22, true)),
                            Center(child: txt("النوع", co1, 22, true)),
                            Center(child: txt("العدل", co1, 22, true)),
                          ]),
                        ],
                      ),
                      /****************** Data *******************/
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return data.length == 0
                                    ? Container(
                                        height: 70,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            border: Border.all(
                                                width: 2, color: co1)),
                                        child: Center(
                                          child: txt(
                                              "لايوجد بيانات", co1, 23, true),
                                        ),
                                      )
                                    : Table(
                                        border: TableBorder.all(
                                            color: co1, width: 2),
                                        defaultVerticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        children: [
                                          TableRow(children: [
                                            Center(
                                                child: txt(
                                                    data[index]["item_name"],
                                                    co1,
                                                    22,
                                                    true)),
                                            Center(
                                                child: txt(
                                                    data[index]["item_price"],
                                                    co1,
                                                    22,
                                                    true)),
                                            Center(
                                                child: txt(
                                                    data[index]["item_cat"] ==
                                                            "1"
                                                        ? "أصل ثابت"
                                                        : data[index][
                                                                    "item_cat"] ==
                                                                "2"
                                                            ? 'أصل عقاري'
                                                            : 'أصل نقدي',
                                                    co1,
                                                    18,
                                                    true)),
                                            Center(
                                                child: txt(
                                                    data[index]["item_iadl"] !=
                                                            ""
                                                        ? data[index]
                                                            ["item_iadl"]
                                                        : "??",
                                                    co1,
                                                    18,
                                                    true)),
                                          ]),
                                        ],
                                      );
                              }),
                        ),
                      ),
                    ],
                  ),
                )),
                Center(
                    child: btn("أضافه أصل", Colors.white, 25, true, () {
                  Get.off(Add_Assets(
                    name_death: widget.name_Death,
                    ID: id,
                  ));
                })),
                Center(
                    child: btn("التالي", Colors.white, 25, false, () {




                  if (data.length > 0) {
                    Get.to(Main_inheritance(), arguments: id);
                  } else {
                    // Message
                    Get.snackbar("تنبيه", "أدخل البيانات اولآ",

                        backgroundColor: Colors.black, colorText: co2);
                  }
                  // GetData();
                })),
                SizedBox(
                  height: 20,
                )
              ],
            ),
    );
  }
}
