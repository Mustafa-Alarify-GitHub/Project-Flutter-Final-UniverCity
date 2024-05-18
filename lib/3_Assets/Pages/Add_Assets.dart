import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustafa/3_Assets/Widget/ButtonAsl.dart';
import 'package:mustafa/3_Assets/Widget/Text_filed_asstets.dart';
import 'package:mustafa/API/Api.dart';
import 'package:mustafa/API/Links.dart';
import 'package:mustafa/My_pro.dart';

import '../Controller/ControllerAddAssets.dart';
import 'MainAssets.dart';

class Add_Assets extends StatelessWidget {
  final String name_death;
  final int ID;

  const Add_Assets({super.key, required this.name_death, required this.ID});

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'أصل ثابت',
      'أصل عقاري',
      'أصل نقدي',
    ];
    ControllerAddAssets controller = Get.put(ControllerAddAssets());

    TextEditingController name = TextEditingController();
    TextEditingController adl = TextEditingController();
    TextEditingController price = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: txt("أضافه أصل جديد", co2, 22, true),
        backgroundColor: co1,
        centerTitle: true,
      ),        backgroundColor: Colors.grey[200],

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFiledAssets(
                Controller: name,
                KeyboardType: TextInputType.name,
                Labl: "الأسم"),
            SizedBox(
              height: 30,
            ),
            TextFiledAssets(
                Controller: price,
                KeyboardType: TextInputType.number,
                Labl: "السعر"),
            SizedBox(
              height: 30,
            ),
            TextFiledAssets(
                Controller: adl,
                KeyboardType: TextInputType.name,
                Labl: "العدل"),
            SizedBox(
              height: 30,
            ),
            Container(
              width: full,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    items.length,
                    (index) => GetBuilder(
                        init: ControllerAddAssets(),
                        builder: (con) => ButtonAsl(
                            text: items[index],
                            color:
                                index == controller.asl - 1 ? co1 : Colors.grey,
                            onTap: () {
                              con.number(index + 1);
                            })),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),

            btn("أضافه", co2, 25, true, () async {
              if (name.text != "" && price.text != "") {
                var ruslt = await Api.postData(LinkApp.addItems, {
                  "item_name": "${name.text}",
                  "item_death": "$ID",
                  "item_price": "${price.text}",
                  "item_cat": "${controller.asl}",
                  "item_iadl": "${adl.text}"
                });
                print(ruslt);
                if (ruslt["status"]== "true") {
                  Get.off(MainAssts(name_Death: this.name_death));
                }
              } else {
                Get.snackbar("تنبيه", "أدخل البيانات اولآ",
                    backgroundColor: Colors.grey, colorText: co2);
              }
            })
          ],
        ),
      ),
    );
  }
}
