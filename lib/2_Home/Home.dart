import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mustafa/2_Home/Home_Controller.dart';
import 'package:mustafa/API/Api.dart';
import 'package:mustafa/API/Links.dart';
import 'package:mustafa/My_pro.dart';
import 'package:mustafa/SherdRefrance/shared_preferences.dart';
import 'package:path/path.dart';

import '../3_Assets/Pages/MainAssets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Home_Controller home_controller = Get.put(Home_Controller());
  TextEditingController nameDeat = TextEditingController();
  TextEditingController c = TextEditingController();

  bool fouesMale = false;
  bool fouesFamale = false;
  int sex = 3;
  String sexstring = "";

  File? file;

  ImagePicker piker = ImagePicker();

  Future<File?> _takePicture() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }

  Future<File?> _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: SizedBox(
            width: full,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  myApper(),
                  Text_Field(nameDeat, TextInputType.name, "أسم المتوفي", 1),
                  SizedBox(
                    width: full,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                sex = 1;
                                fouesMale = true;
                                fouesFamale = false;
                              });
                            },
                            child: Row(
                              children: [
                                txt("ذكر", co1, fouesMale == false ? 25 : 35,
                                    true),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      color: sex == 1 ? co1 : Colors.white),
                                ),
                              ],
                            )),
                        const SizedBox(
                          width: 40,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                sex = 0;
                                fouesMale = false;
                                fouesFamale = true;
                              });
                            },
                            child: Row(
                              children: [
                                txt("أنثئ", co1, fouesFamale == false ? 25 : 35,
                                    true),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      color: sex == 0 ? co1 : Colors.white),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  home_controller.imgpiker == null
                      ? btn("الحصر الوراثي", co2, 25, true, () {
                          Get.bottomSheet(
                              backgroundColor: Colors.white,
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                              final imageFile =
                              await _takePicture();
                              if (imageFile != null) {
                              home_controller.imgpiker =
                              imageFile;
                              Get.back();
                              setState(() {});
                              }
                              },
                                      child: Column(
                                        children: [
                                         Icon(
                                                Icons.camera_alt,
                                                color: co1,
                                                size: 50,
                                              ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "الكاميره",
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        final imageFile =
                                            await _pickImageFromGallery();
                                        if (imageFile != null) {
                                          home_controller.imgpiker = imageFile;
                                          print(imageFile);
                                          Get.back();
                                          setState(() {});
                                        }
                                      },
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.image,
                                            color: co1,
                                            size: 50,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "الاستديوه",
                                            style: TextStyle(fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        })
                      : Column(
                          children: [
                            Image.file(
                              home_controller.imgpiker,
                              width: 200,
                            ),
                            IconButton(
                                onPressed: () {
                                  home_controller.imgpiker = null;
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 40,
                                )),
                          ],
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  btn("التالي", co2, 25, true, () async {
                    if (nameDeat.text != "" && sex != 3) {
                      var ruslt = await Api.postData(LinkApp.Death,
                          {"name": nameDeat.text, "sex": '$sex'});
                      if (ruslt["status"] == "true") {
                        shared.setData(shared.key_Name, nameDeat.text);
                        Get.to(MainAssts(name_Death: nameDeat.text));
                      }
                    } else {
                      Get.snackbar("تنبيه", "أدخل البيانات اولآ",
                          backgroundColor: Colors.grey, colorText: co2);
                    }
                  })
                ],
              ),
            ),
          )),
    );
  }
}
