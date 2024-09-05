import 'package:get/get.dart';
import 'package:mustafa/API/Api.dart';
import 'package:mustafa/API/Links.dart';
import 'package:mustafa/SherdRefrance/shared_preferences.dart';

class Result_Controller extends GetxController {

  bool lodding =true;

  double mony = 0;
  double ruslt_mony = 0;


// Index
  // 'ام',
  int mather = 0;

  // 'اب',
  int father = 1;

  // 'جد',
  int grand_father = 2;

  // 'جده',
  int grand_mather = 3;

  // 'ابن',
  int son = 4;

  // 'بنت',
  int daughter = 5;

  // 'ابن الأبن',
  int son_son = 6;

  // 'بنت الأبن',
  int son_daughter = 7;

  // 'أخ شقيق',
  int brother_brother = 8;

  // 'أخت شقيقه',
  int sister_brother = 9;

  // 'أخ لأب',
  int brother_father = 10;

  // 'أخت لأب',
  int sister_father = 11;

  // 'أخ او خت لأم',
  int sister_brother_mather = 12;

  // 'أبن أخ شقيق',
  int son_brother_brother = 13;

  // 'أبن أخ لأب',
  int son_brother_father = 14;

  // 'عم شقيق',
  int uncle_brother = 15;

  // 'عم لأب',
  int uncle_father = 16;

  // 'أبن عم شقيق',
  int son_uncle_brother = 17;

  // 'أبن عم لأب',
  int son_uncle_father = 18;

  // 'زوج',
  int husband = 19;

  // 'زوجه'
  int wife = 20;
  List <int> array_ = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];
  List <double> array_mony = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ];



  Get_Items() async {
    var id = await shared.getData(shared.key_ID);
    var respones = await Api.postData(LinkApp.get_Items, {"name": "$id"});

    for(int i=0;i<respones["count"];i++){
      mony+=double.parse(respones['data'][i]['item_price']);
      ruslt_mony+=double.parse(respones['data'][i]['item_price']);
    }

  }


  Updata_In(price,id)async{
  var respones =await Api.postData(LinkApp.updata_Inheritance, {
    "price":"$price",
    "id":"$id"
  });
}

  List data_in = [];
  Get_Data_Inheritance() async {
      var id = await shared.getData(shared.key_ID);
      data_in.clear();
      var ruslt = await Api.postData(LinkApp.get_Data_Inheritance, {"id": '$id'});

      if (ruslt["status"] == "true") {
        data_in.addAll(ruslt["data"]);
        lodding=false;
        update();

    }
  }

  Division_Inheritance(data)async {

   await Get_Items();
    for (int i = 0; i < data.length; i++) {
      var type =data[i]["type"];
      switch(type)
      {
        case "ام" :array_[mather]++;break;
        case "اب" :array_[father]++;break;
        case "جد" :array_[grand_father]++;break;
        case "جده" :array_[grand_mather]++;break;
        case "ابن" :array_[son]++;break;
        case "بنت" :array_[daughter]++;break;
        case "ابن الأبن" :array_[son_son]++;break;
        case "بنت الأبن" :array_[son_daughter]++;break;
        case "أخ شقيق" :array_[brother_brother]++;break;
        case "أخت شقيقه" :array_[sister_brother]++;break;
        case "أخ لأب" :array_[brother_father]++;break;
        case "أخت لأب" :array_[sister_father]++;break;
        case "أخ او خت لأم" :array_[sister_brother_mather]++;break;
        case "أبن أخ شقيق" :array_[son_brother_brother]++;break;
        case "أبن أخ لأب" :array_[son_brother_father]++;break;
        case "عم شقيق" :array_[uncle_brother]++;break;
        case "عم لأب" :array_[uncle_father]++;break;
        case "أبن عم شقيق" :array_[son_uncle_brother]++;break;
        case "أبن عم لأب" :array_[son_uncle_father]++;break;
        case "زوج" :array_[husband]++;break;
        case "زوجه" :array_[wife]++;break;
      }// end Switch
    }// end for


    if (array_[father] > 0) array_[father] = 1;
    if (array_[mather] > 0) array_[mather] = 1;
    if (array_[grand_father] > 0) array_[grand_father] = 1;
    if (array_[grand_mather] > 0) array_[grand_mather] = 1;
    if (array_[husband] > 0) array_[husband] = 1;
    if (array_[wife] > 4) array_[wife] = 4;

    // All Mony
    int one = 0;
    int index_one = 0;
    for (int i = 0; i < array_.length; i++) {
      if (array_[i] != 0) {
        one++;
        index_one = i;
        if (one > 1) {
          break;
        }
      }
    }
    if (one == 1) {
      array_mony[index_one] = mony;
    } // End All Mony



    // mather & grand_mather
    if (array_[mather] > 0) {
      if (array_[son] > 0 || array_[daughter] > 0) {
        array_mony[mather] = mony / 6;
        ruslt_mony -= mony / 6;
      } else {
        if (array_[son] == 0 &&
            array_[daughter] == 0 &&
            array_[wife] == 0 &&
            array_[husband] == 0
            ) {
          array_mony[mather] = mony / 3;
          ruslt_mony -= mony / 3;
        } else if (array_[son] == 0 &&
            array_[daughter] == 0 &&
            array_[wife] == 0 &&
            array_[husband] == 1
            ) {
          array_mony[mather] = mony / 6;
          ruslt_mony -= mony / 6;
        }
      }
    }
    if (array_[grand_mather] > 0 && array_[mather] == 0) {
      if (array_[son] > 0 || array_[daughter] > 0) {
        array_mony[grand_mather] = mony / 6;
        ruslt_mony -= mony / 6;
      } else {
        if (array_[son] == 0 &&
            array_[daughter] == 0 &&
            array_[wife] == 0 &&
            array_[husband] == 0 &&
            array_[mather] == 0 &&
            array_[grand_father] == 1) {
          array_mony[grand_mather] = mony / 2;
        } else if (array_[son] == 0 &&
            array_[daughter] == 0 &&
            array_[wife] == 0 &&
            array_[husband] == 1 &&
            array_[mather] == 0 &&
            array_[grand_father] == 1) {
          array_mony[grand_mather] = mony / 6;
          ruslt_mony -= mony / 6;
        }
      }
    }

   // Father & grand_father
   if (array_[father] > 0) {
     if (array_[son] > 0 || array_[daughter] > 0) {
       array_mony[father] = mony / 6;
       ruslt_mony -= mony / 6;
     } else {
       if (array_[son] == 0 &&
           array_[daughter] == 0 &&
           array_[wife] == 0 &&
           array_[husband] == 0 &&
           array_[mather] == 1) {
         array_mony[father] = ruslt_mony;
       } else if (array_[son] == 0 &&
           array_[daughter] == 0 &&
           array_[wife] == 0 &&
           array_[husband] == 1 &&
           array_[mather] == 1) {
         array_mony[father] = mony / 3;
         ruslt_mony -= mony / 3;
       }
     }
   }
   if (array_[grand_father] > 0 && array_[father] == 0) {
     if (array_[son] > 0 || array_[daughter] > 0) {
       array_mony[grand_father] = mony / 6;
       ruslt_mony -= mony / 6;
     } else {
       if (array_[son] == 0 &&
           array_[daughter] == 0 &&
           array_[wife] == 0 &&
           array_[husband] == 0 &&
           array_[father] == 0 &&
           array_[grand_mather] == 1) {
         array_mony[grand_father] = mony / 2;
       } else if (array_[son] == 0 &&
           array_[daughter] == 0 &&
           array_[wife] == 0 &&
           array_[husband] == 1 &&
           array_[father] == 0 &&
           array_[grand_mather] == 1) {
         array_mony[grand_father] = mony / 3;
         ruslt_mony -= mony / 3;
       }
     }
   }

   // Wife
    if (array_[wife] > 0) {
      if (array_[son] > 0 || array_[daughter] > 0) {
        double velue = mony / 8;
        array_mony[wife] = velue / array_[wife];
        ruslt_mony -= mony / 8;
      } else {
        double velue = mony / 4;
        array_mony[wife] = velue / array_[wife];
        ruslt_mony -= mony / 4;
//
        if (array_[father] > 0 && array_[mather] > 0) {
          array_mony[father] = ruslt_mony / 2;
          array_mony[mather] = ruslt_mony / 2;
        } else if (array_[father] > 0) {
          array_mony[father] = ruslt_mony;
        } else if (array_[mather] > 0) {
          array_mony[mather] = ruslt_mony;
        } else if (array_[grand_father] > 0 && array_[grand_mather] > 0) {
          array_mony[grand_father] = ruslt_mony / 2;
          array_mony[grand_mather] = ruslt_mony / 2;
        } else if (array_[grand_father] > 0) {
          array_mony[grand_father] = ruslt_mony;
        } else if (array_[grand_mather] > 0) {
          array_mony[grand_mather] = ruslt_mony;
        }
      }
    }

    // husband
    if (array_[husband] == 1) {
      if (array_[son] > 0 || array_[daughter] > 0) {
        array_mony[husband] = mony / 4;
        ruslt_mony -= mony / 4;
      } else {
        array_mony[husband] = mony / 2;
        ruslt_mony -= mony / 2;
      }
    }

    // childern
    if (array_[son] > 0 || array_[daughter] > 0) {
      int number_daughter = array_[daughter];
      int numberSon = array_[son] * 2;
      int allChildern = number_daughter + numberSon;
      double velue = ruslt_mony / allChildern;
      array_mony[son] = velue * 2;
      array_mony[daughter] = velue * 1;
    }

    // brother_brother brother_father
   if(array_[son] == 0 && array_[daughter] == 0 && array_[father]==0){

   }



    for (int i = 0; i < data.length; i++) {
      switch(data[i]['type'])
      {
        case "ام" :Updata_In(array_mony[mather], data[i]['Inh_id']);break;
        case "اب" :Updata_In(array_mony[father], data[i]['Inh_id']);break;
        case "جد" :Updata_In(array_mony[grand_father], data[i]['Inh_id']);break;
        case "جده" :Updata_In(array_mony[grand_mather], data[i]['Inh_id']);break;
        case "ابن" :Updata_In(array_mony[son], data[i]['Inh_id']);break;
        case "بنت" :Updata_In(array_mony[daughter], data[i]['Inh_id']);break;
        case "ابن الأبن" :Updata_In(array_mony[son_son], data[i]['Inh_id']);break;
        case "بنت الأبن" :Updata_In(array_mony[son_daughter], data[i]['Inh_id']);break;
        case "أخ شقيق" :Updata_In(array_mony[brother_brother], data[i]['Inh_id']);break;
        case "أخت شقيقه" :Updata_In(array_mony[sister_brother], data[i]['Inh_id']);break;
        case "أخ لأب" :Updata_In(array_mony[brother_father], data[i]['Inh_id']);break;
        case "أخت لأب" :Updata_In(array_mony[sister_father], data[i]['Inh_id']);break;
        case "أخ او خت لأم" :Updata_In(array_mony[sister_brother_mather], data[i]['Inh_id']);break;
        case "أبن أخ شقيق" :Updata_In(array_mony[son_brother_brother], data[i]['Inh_id']);break;
        case "أبن أخ لأب" :Updata_In(array_mony[son_brother_father], data[i]['Inh_id']);break;
        case "عم شقيق" :Updata_In(array_mony[uncle_brother], data[i]['Inh_id']);break;
        case "عم لأب" :Updata_In(array_mony[uncle_father], data[i]['Inh_id']);break;
        case "أبن عم شقيق" :Updata_In(array_mony[son_uncle_brother], data[i]['Inh_id']);break;
        case "أبن عم لأب" :Updata_In(array_mony[son_uncle_father], data[i]['Inh_id']);break;
        case "زوج" :Updata_In(array_mony[husband], data[i]['Inh_id']);break;
        case "زوجه" :Updata_In(array_mony[wife], data[i]['Inh_id']);break;
      }
    }
    await Future.delayed(Duration(milliseconds: 1000));
    await Get_Data_Inheritance();
  }
} // end class

