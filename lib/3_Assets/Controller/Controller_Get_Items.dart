import 'package:get/get.dart';
import '../../API/Api.dart';
import '../../API/Links.dart';

class Controller_Get_Items extends GetxController {

  List data = [];
  int id = 0;
  bool loding = true;
  String name_dea="";

  Get_ID_Death(n) async {
    var ruspones =
        await Api.postData(LinkApp.get_ID, {"name": "$n"});
    id = int.parse(ruspones["data"][0]["death_id"]);
  }

  Get_Items() async {
    data.clear();
    var ruspones = await Api.postData(LinkApp.get_Items, {"name": "$id"});
    if (ruspones["status"] == "true") {
      data.addAll(ruspones["data"]);
    }
    loding = false;

    update();
  }
@override
  void onReady() {


  }
@override
  void onInit() {
  name_dea=Get.arguments;
  Get_ID_Death(name_dea);
  Get_Items();
  }
}
