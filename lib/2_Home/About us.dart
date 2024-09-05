import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mustafa/My_pro.dart';


class About extends StatelessWidget {

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
                  Container(
                    child:Text('حول التطبيق',  style: TextStyle(
                        fontSize:25 ,
                        fontWeight:
                        FontWeight.bold ),textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 20),
               const   Text(
                    'تطبيق تقسيم الميراث',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const  Text(
                      'تطبيق تقسيم الميراث هو تطبيق يساعدك في حساب وتقسيم التركة بين المستفيدين بطريقة عادلة وشفافة. يمكنك إدخال تفاصيل الميراث والمستفيدين وسيقوم التطبيق بحساب حصة كل شخص وعرض النتائج بشكل واضح ومفهوم.',
                      textAlign: TextAlign.center,style: TextStyle(fontSize: 16),
                    ),
                ),
                  SizedBox(height: 16),
                 const Text(
                    'ميزات التطبيق:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                 const Text('- حساب التركة بناءً على المعلومات المدخلة.'),
                const  Text('- تقسيم الميراث بشكل عادل ومتساوٍ.'),
               const   Text('- عرض النتائج بشكل واضح ومفهوم.'),
                  SizedBox(height: 16),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Column(
      children: [
        Text(
          'مطورين التطبيق',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text('مصطفى العريفي'),
        Text('عماد الحمادي'),
        Text(''),
        Text(''),
        Text(''),
      ],
    ),

    Column(
      children: [
        Text(
          'اصدار التطبيق',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text('الإصدار 1.0.0'),
      ],
    ),

  ],
)


]

  )


              ),
            ),
          ),
    );
  }
}
