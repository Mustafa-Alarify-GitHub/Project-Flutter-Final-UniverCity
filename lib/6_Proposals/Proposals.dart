import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mustafa/6_Proposals/Controller_Proposals.dart';
import 'package:mustafa/6_Proposals/Widget/Card.dart';
import '../My_pro.dart';

class Proposals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller_Proposals controller = Get.put(Controller_Proposals());

    controller.Get_Data_Inheritance();
    controller.Get_Items();

    return Scaffold(
        appBar: AppBar(
          title: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset("images/icon.png")),
          centerTitle: true,
          backgroundColor: co1,
        ),
        body: Column(
          children: [
            const Text(
              "مقترح للقسمه",
              style: TextStyle(fontSize: 35),
            ),
            Expanded(
                child: Container(
              child: GetBuilder(
                init: Controller_Proposals(),
                builder: (context) => controller.lodding
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.data_In.length + 1,
                        itemBuilder: (context, index) =>index != controller.data_In.length
                            ? Card_Proposals(
                                name: controller.data_In[index]["Inh_name"],
                                type: controller.data_In[index]["type"],
                                price: controller.data_In[index]["price"],
                                widget: controller.Get_one_items(
                                    double.parse(
                                        controller.data_In[index]["price"]),
                                    context),
                              )
                            : btn("التقارير", co2, 22, true, () {
                                controller.Print_PDF();
                              }),
                      ),
              ),
            )),
            btn("مقترح اخر", co2, 22, true, () {
              controller.Updata_Page();
            }),
          ],
        ));
  }
}
