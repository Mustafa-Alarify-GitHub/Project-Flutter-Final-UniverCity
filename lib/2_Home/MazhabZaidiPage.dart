import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mustafa/My_pro.dart';


class MazhabZaidiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SizedBox(
          width: full,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      myApper(),
                      Container(
                        child:Text('المذهب الذي يتبعه التطبيق',  style: TextStyle(
                            fontSize:25 ,
                            fontWeight:
                            FontWeight.bold ),textAlign: TextAlign.center,),
                      )
,
                      SizedBox(height: 20),
                      txt22('المذهب الزيدي', 20),

                      SizedBox(height: 16),
                      txt33( 'المذهب الزيدي هو أحد المذاهب الإسلامية الفقهية والذي يتبعه جماعة من المسلمين في بعض الدول العربية، ويعتبر المذهب الرسمي في اليمن. يستند المذهب الزيدي على المنهج الفقهي الإسلامي ويعتبر واحدًا من الفروع الرئيسية للإسلام السني. يشتهر المذهب الزيدي بتأكيده على العدل والمساواة وحقوق الإنسان والحرية الشخصية.',
                          16),

                      SizedBox(height: 16),
                      Text(
                        'مبادئ المذهب الزيدي:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('- تأكيد على العدل والمساواة.'),
                      Text('- احترام حقوق الإنسان والحرية الشخصية.'),
                      Text('- الالتزام بالمنهج الفقهي الإسلامي.'),

                      SizedBox(height: 16),
                      txt22('نصيب الورثة :', 18),

                      SizedBox(height: 16),
                      txt22( 'نصيب الزوج من الميراث :', 16),

                      SizedBox(height: 8),
                      txt33('النصف معا انعدام الفرع الوارث او 	الربع إذا وجد فرع وارث للزوجة.الإبن وابن الإبن والبنت وبنت الإبن من النصف إلى الربع.', 14),
                      txt22( 'نصيب الزوجة من الميراث :', 16),
                      txt33('الربع إذا لم يكن للزوج فرع وارث. او الثمن إذا كان للزوج فرع وارث', 14),
                      txt22( 'نصيب الأم من الميراث:', 16),
                      txt33('السدس بشرط وجود الولد أو ولد الإبن أو اثنين فأكثر من الإخوة وارثين أو محجوبين. او الثلث بشرط عدم الفرع الوارث وعدم إثنين فأكثر من الإخوة ولو حجبوا', 14),
                      txt22( 'نصيب الأب  من الميراث:', 16),
                      txt33('السدس بشرط وجود الولد أو ولد الإبن ذكرا كان أو أنثى.', 14),
                      txt22( 'نصيب الجد   من الميراث:', 16),
                      txt33('يرث الجد بالفرض سدس التركة بشرط أن يكون للميت فرع وارث ذكر، وفي الثانية يرث الجد بالتعصيب فقط في حال ألا يكون للمتوفى فرع وارث', 14),
                      txt22( 'نصيب الجدة   من الميراث:', 16),
                      txt33('ميراث الجدة بالسدس،', 14),
                      txt22( 'نصيب البنات    من الميراث:', 16),
                      txt33('حيث يرثن بالفرض إذا لم يكن معهن أخوهن، فإن كانت ابنة واحدة يكن لها نصف التركة، وإن كانتا ابنتين اثنتين أو أكثر يرثن الثلثان. وفي الحالة الأخرى يرثن بالتعصيب بالغير عندما يكون معهن أخوهن؛ وهو ما ورد في سورة النساء (يُوصِيكُمُ اللَّهُ فِي أَوْلَادِكُمْ لِلذَّكَرِ مِثْلُ حَظِّ الْأُنْثَيَيْنِ).', 14),
                      txt22( 'نصيب الابن    من الميراث:', 16),
                      txt33('يرث الكل اذا كان وحده واذا كان يوجد بنت فللذكر مثل حظ الانثيين', 14)

                    ]

                )


            ),
          ),
        ),
      ),
    );
  }
  Widget txt22(txt_, double fontSize_) {
    return Text(txt_,
        style: TextStyle(

            fontSize: fontSize_,
            fontWeight:
        FontWeight.bold ));
  }
  Widget txt33(txt_,double fontSize_) {
    return Text(txt_,textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: fontSize_,
     ));
  }
}


