import 'dart:io';
import 'package:get/get.dart';
import 'package:mustafa/2_Home/Home_Controller.dart';
import 'package:mustafa/My_pro.dart';
import 'package:mustafa/SherdRefrance/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PDF {
  static String name_De = '';
  static Map data = {};
  static List Itmes = [];
  static double totle_price = 0;

  static void Get_NameDe(data_for_map, items) async {
    Itmes.clear();
    for(int i=0;i<Itmes.length;i++){
      totle_price+=double.parse(Itmes[i]["item_price"]);
    }
    name_De = await shared.getData(shared.key_Name);
    data = data_for_map;
    Itmes = items;
    totle_price=totle_price;
    print("}}}}}}}}}}}}}}}}}}}}}");
    print(data);
    print("}}}}}}}}}}}}}}}}}}}}}");
  }

  static pw.Widget Signature() {
    return pw.Container(
        child: pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Column(children: [
          pw.Container(
            width: 100,
            height: 100,
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.black),
            ),
          ),
          pw.Container(
            margin:
                const pw.EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
            child: pw.Center(child: pw.Text('الختم')),
          ),
        ]),
        pw.Column(children: [
          pw.Container(
            width: 100,
            height: 100,
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.black),
            ),
          ),
          pw.Container(
            margin:
                const pw.EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
            child: pw.Center(child: pw.Text('التوقيع')),
          ),
        ]),
      ],
    ));
  }


  static late pw.Font arFont;

  static init() async {
    arFont = pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo-Bold.ttf"));
  }

  static createPdf() async {
    await init();

    List<Directory>? directories = await getExternalStorageDirectories();
    Directory downloadsDirectory = directories!.first;
    String path = downloadsDirectory.path;

    File file = File('$path/MY_PDF.pdf');

    pw.Document pdf = pw.Document();
    final imageData = await rootBundle.load('images/eet1pn.png');
    final bytesr = imageData.buffer.asUint8List();

    // إضافة الصورة إلى الملف PDF
    final imageProvider = pw.MemoryImage(bytesr);
    final image = pw.Image(imageProvider);

    // image HSER
    Home_Controller home_ = Get.put(Home_Controller());
    var imageg;
    if (home_.imgpiker != null) {
      imageg = pw.MemoryImage(
        File(home_.imgpiker!.path).readAsBytesSync(),
      );
    }

    pdf.addPage(pw.MultiPage(
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(
          base: arFont,
        ),
        build: (context) => [
              pw.Column(
                children: [
                  pw.Container(
                    margin: const pw.EdgeInsets.only(
                        left: 0, top: -70, right: 0, bottom: 0),
                    child: image,
                  ),
                  pw.Container(
                      margin: const pw.EdgeInsets.only(
                          left: 0, top: 1, right: 0, bottom: 5),
                      child: pw.Text(
                        "وثيقة تقسيم التركة",
                        style: pw.TextStyle(fontSize: 18),
                      )),
                  pw.Container(
                    alignment: pw.Alignment.centerRight,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Expanded(
                          child: pw.Text(
                            name_De,
                            style: pw.TextStyle(fontSize: 16),
                          ),
                        ),
                        pw.Text(
                          'اسم المتوفي /',
                          style: pw.TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  // Get_Data(),
                  pw.SizedBox(height: 20),
                  pw.Text(
                    "الحصر الوراثي",
                    style: pw.TextStyle(fontSize: 20),
                  ),
                  imageg != null
                      ? pw.Image(imageg, width: 300)
                      : pw.Padding(
                          padding: pw.EdgeInsets.only(top: 50),
                          child: pw.Text(
                            "لم يتم ارفاقه",
                            style: pw.TextStyle(fontSize: 18),
                          )),
                  pw.SizedBox(height: 20),

                  Signature()
                ],
              ),
            ]));
    pdf.addPage(
      pw.MultiPage(
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(
          base: arFont,
        ),
        build: (pw.Context context) => [
          pw.Column(children: [
            pw.Center(
                child: pw.Text("بيانات الوراثه",
                    style: pw.TextStyle(fontSize: 25))),
            pw.Container(
                margin: pw.EdgeInsets.only(top: 20),
                width: double.infinity,
                child: pw.Row(children: [
                  pw.Expanded(
                    flex: 1,
                    child: pw.Container(
                        alignment: pw.Alignment.center,
                        decoration:
                            pw.BoxDecoration(border: pw.Border.all(width: 2)),
                        child: pw.Text("صله القرابه",
                            style: pw.TextStyle(fontSize: 18))),
                  ),
                  pw.Expanded(
                    flex: 3,
                    child: pw.Container(
                        alignment: pw.Alignment.center,
                        decoration:
                            pw.BoxDecoration(border: pw.Border.all(width: 2)),
                        child: pw.Text("اسم الوريث",
                            style: pw.TextStyle(fontSize: 18))),
                  ),
                ])),
            ...List.generate(
              data.length,
              (index) => pw.Container(
                  width: double.infinity,
                  child: pw.Row(children: [
                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                          alignment: pw.Alignment.center,
                          decoration:
                              pw.BoxDecoration(border: pw.Border.all(width: 2)),
                          child: pw.Text(data[index]["type"],
                              style: pw.TextStyle(fontSize: 15))),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Container(
                          alignment: pw.Alignment.center,
                          decoration:
                              pw.BoxDecoration(border: pw.Border.all(width: 2)),
                          child: pw.Text(data[index]["name_In"],
                              style: pw.TextStyle(fontSize: 15))),
                    ),
                  ])),
            ),
          ])
        ],
      ),
    );

    // Data All Items
    pdf.addPage(
      pw.MultiPage(
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(
          base: arFont,
        ),
        build: (pw.Context context) => [
          pw.Column(children: [
            pw.Center(
                child: pw.Text("بيانات الاصوال",
                    style: pw.TextStyle(fontSize: 25))),
            pw.Container(
                margin: pw.EdgeInsets.only(top: 20),
                width: double.infinity,
                child: pw.Row(children: [
                  pw.Expanded(
                    child: pw.Container(
                        alignment: pw.Alignment.center,
                        decoration:
                            pw.BoxDecoration(border: pw.Border.all(width: 2)),
                        child: pw.Text("العدل",
                            style: pw.TextStyle(fontSize: 18))),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                        alignment: pw.Alignment.center,
                        decoration:
                            pw.BoxDecoration(border: pw.Border.all(width: 2)),
                        child: pw.Text("النوع",
                            style: pw.TextStyle(fontSize: 18))),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                        alignment: pw.Alignment.center,
                        decoration:
                            pw.BoxDecoration(border: pw.Border.all(width: 2)),
                        child: pw.Text("القيمة ",
                            style: pw.TextStyle(fontSize: 18))),
                  ),
                  pw.Expanded(
                    child: pw.Container(
                        alignment: pw.Alignment.center,
                        decoration:
                            pw.BoxDecoration(border: pw.Border.all(width: 2)),
                        child: pw.Text("أسم الأصل",
                            style: pw.TextStyle(fontSize: 18))),
                  ),
                ])),
            ...List.generate(
              Itmes.length,
              (index) => pw.Container(
                  width: double.infinity,
                  child: pw.Row(children: [
                    pw.Expanded(
                      child: pw.Container(
                          alignment: pw.Alignment.center,
                          decoration:
                              pw.BoxDecoration(border: pw.Border.all(width: 2)),
                          child: pw.Text(
                              Itmes[index]["item_iadl"] == ""
                                  ? "?"
                                  : Itmes[index]["item_iadl"],
                              style: pw.TextStyle(fontSize: 15))),
                    ),
                    pw.Expanded(
                      child: pw.Container(
                          alignment: pw.Alignment.center,
                          decoration:
                              pw.BoxDecoration(border: pw.Border.all(width: 2)),
                          child: pw.Text(
                              Itmes[index]["item_cat"] == "1"
                                  ? "أصل ثابت"
                                  : data[index]["item_cat"] == "2"
                                      ? 'أصل عقاري'
                                      : 'أصل نقدي',
                              style: pw.TextStyle(fontSize: 15))),
                    ),
                    pw.Expanded(
                      child: pw.Container(
                          alignment: pw.Alignment.center,
                          decoration:
                              pw.BoxDecoration(border: pw.Border.all(width: 2)),
                          child: pw.Text(Itmes[index]["item_price"],
                              style: pw.TextStyle(fontSize: 15))),
                    ),
                    pw.Expanded(
                      child: pw.Container(
                          alignment: pw.Alignment.center,
                          decoration:
                              pw.BoxDecoration(border: pw.Border.all(width: 2)),
                          child: pw.Text(Itmes[index]["item_name"],
                              style: pw.TextStyle(fontSize: 15))),
                    ),
                  ])),

            ),
          ])
        ],
      ),
    );


    ////////
    pdf.addPage(
        pw.MultiPage(
            textDirection: pw.TextDirection.rtl,
            theme: pw.ThemeData.withFont(
              base: arFont,
            ),
            build: (pw.Context context) => [
              pw.Column(children: [
                pw.Center(
                    child: pw.Text("مقترح القسمه",
                        style: pw.TextStyle(fontSize: 25))),
                ...List.generate(data.length, (index) => pw.Container(
                    margin: pw.EdgeInsets.only(bottom: 30),
                    child: pw.Column(
                  children: [
                   pw.Container(
                     padding: pw.EdgeInsets.symmetric(horizontal: 20),
                     decoration: pw.BoxDecoration(
                     border: pw.Border.all(width: 1)
                   ),
                   child: pw.Row(
                       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                       children: [
                     pw.Text(" صله القرابه/    ${data[index]["type"]}",style: pw.TextStyle(fontSize: 15)),

                     pw.Text(" أسم الوريث /${data[index]["name_In"]}",style: pw.TextStyle(fontSize: 15)),

                   ]),
                   ),
                    pw.Text("الموروث:",style: pw.TextStyle(fontSize: 18)),
                      ...List.generate(data[index]["price_i"].length, (i) => pw.Container(
                        width: double.infinity,
                        padding: pw.EdgeInsets.symmetric(horizontal: 40),
                        decoration: pw.BoxDecoration(
                            border: pw.Border.all(width: 1)
                        ),
                        child:
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(" ${data[index]["price_i"][i]}",style: pw.TextStyle(fontSize: 15)),
                            pw.Text(" ${data[index]["name_i"][i]}",style: pw.TextStyle(fontSize: 15)),


                          ]),)),
                    pw.Container(
                      margin: pw.EdgeInsets.only(bottom: 20),
                      padding: pw.EdgeInsets.symmetric(horizontal: 20),
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(width: 1)
                      ),
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Text(" ألمبلغ المتبقي/    ${data[index]["totle_price"]}",style: pw.TextStyle(fontSize: 15)),
                          ]),
                    ),
                    pw.Divider(
                      height: 2,thickness: 4

                    ),
                  ]
                ))

              )
            ])]));
    Uint8List bytes = await pdf.save();
    await file.writeAsBytes(bytes);

    await OpenFile.open(file.path);
  }
}
