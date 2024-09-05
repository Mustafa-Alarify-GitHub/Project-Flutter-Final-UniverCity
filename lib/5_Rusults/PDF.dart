import 'dart:io';
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

  static void Get_NameDe(data_for_map) async {
    name_De = await shared.getData(shared.key_Name);
    data = data_for_map;
    print(data);
  }

  static pw.Widget Get_Data() {
    return pw.Container(
        child: pw.Column(children: [
      ...List.generate(
          data.length,
          (index) => pw.Container(
                width: full,
                padding: pw.EdgeInsets.all(5),
                margin: pw.EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                decoration: pw.BoxDecoration(border: pw.Border.all(width: 2)),
                child: pw.Column(
                  children: [
                    pw.Row(
                      children: [
                        pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                          children: [
                            pw.Stack(
                              children: [
                                pw.Container(
                                  width: 240,
                                  height: 60,
                                  decoration: pw.BoxDecoration(
                                    borderRadius: pw.BorderRadius.circular(17),
                                    border: pw.Border.all(
                                      width: 2,
                                    ),
                                  ),
                                  child: pw.Center(
                                    child: pw.Text(
                                      data[index]['name_In'],
                                      style: pw.TextStyle(fontSize: 25),
                                    ),
                                  ),
                                ),
                                pw.Positioned(
                                    top: -8,
                                    right: 17,
                                    child: pw.Container(
                                      padding: pw.EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: pw.Center(
                                        child: pw.Text(
                                          "أسم الوريث",
                                          style: pw.TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                        pw.Spacer(),
                        pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                          children: [
                            pw.Stack(
                              children: [
                                pw.Container(
                                  width: 130,
                                  height: 60,
                                  decoration: pw.BoxDecoration(
                                      borderRadius:
                                          pw.BorderRadius.circular(17),
                                      border: pw.Border.all(
                                        width: 2,
                                      )),
                                  child: pw.Center(
                                    child: pw.Text(
                                      data[index]['type'],
                                      style: pw.TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                pw.Positioned(
                                    top: -8,
                                    right: 17,
                                    child: pw.Container(
                                      padding: pw.EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: pw.Center(
                                        child: pw.Text(
                                          "صله القرأبه",
                                          style: pw.TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    pw.SizedBox(
                      height: 11,
                    ),
                    pw.Container(
                      width: full,
                      decoration:
                          pw.BoxDecoration(border: pw.Border.all(width: 2)),
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        "الاصوال",
                        style: pw.TextStyle(
                            fontSize: 25, fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          child: pw.Container(
                            decoration: pw.BoxDecoration(
                                border: pw.Border.all(width: 2)),
                            alignment: pw.Alignment.center,
                            child: pw.Text(
                              "اسم الاصل",
                              style: pw.TextStyle(
                                  fontSize: 25, fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Container(
                            decoration: pw.BoxDecoration(
                                border: pw.Border.all(width: 2)),
                            alignment: pw.Alignment.center,
                            child: pw.Text(
                              "قيمه الاصل",
                              style: pw.TextStyle(
                                  fontSize: 25, fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    /****************************************** *********************************************/
                    /************************************ Data for Map **************************************/
                    /****************************************** *********************************************/
                    pw.Column(
                      children: [
                        ...List.generate(
                            data[index]["price_i"].length,
                            (index_2) => pw.Row(
                                  children: [
                                    pw.Expanded(
                                        child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            child: pw.Text(
                                              "${data[index]["name_i"][index_2]}",
                                              style: pw.TextStyle(fontSize: 18),
                                            ))),
                                    pw.Expanded(
                                        child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            child: pw.Text(
                                              "${data[index]["price_i"][index_2]}",
                                              style: pw.TextStyle(fontSize: 18),
                                            ))),
                                  ],
                                )),
                        pw.Divider(
                          height: 2,
                          endIndent: 10,
                          indent: 10,
                        ),
                        pw.Row(
                          children: [
                            pw.Expanded(
                                child: pw.Container(
                                    alignment: pw.Alignment.center,
                                    child: pw.Text(
                                      "المبلغ المتبقي",
                                      style: pw.TextStyle(fontSize: 18),
                                    ))),
                            pw.Expanded(
                                child: pw.Container(
                                    alignment: pw.Alignment.center,
                                    child: pw.Text(
                                      "${data[index]['totle_price']}",
                                      style: pw.TextStyle(fontSize: 20),
                                    ))),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ))
    ]));
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

    pdf.addPage(pw.MultiPage(
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(
          base: arFont,
        ),
        build: (context) => [
              //  Get_Data(1),
              // ]
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
                  Get_Data(),
                  pw.SizedBox(height: 20),
                  pw.Container(
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
                            margin: const pw.EdgeInsets.only(
                                left: 0, top: 0, right: 0, bottom: 0),
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
                            margin: const pw.EdgeInsets.only(
                                left: 0, top: 0, right: 0, bottom: 0),
                            child: pw.Center(child: pw.Text('التوقيع')),
                          ),
                        ]),
                        pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            children: [
                              pw.Container(
                                width: 100,
                                height: 100,
                                decoration: pw.BoxDecoration(
                                  border: pw.Border.all(color: PdfColors.black),
                                ),
                              ),
                              pw.Container(
                                child: pw.Center(child: pw.Text('اهلا بكم')),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ],
              ),
            ]));



    Uint8List bytes = await pdf.save();
    await file.writeAsBytes(bytes);
    // createImg(file.path);
    await OpenFile.open(file.path);
  }


}
