import 'package:shared_preferences/shared_preferences.dart';

class shared {
  static setData(key, value) async {
    SharedPreferences shard = await SharedPreferences.getInstance();
    shard.setString(key, value);
  }

  static getData(key) async {
    SharedPreferences shard = await SharedPreferences.getInstance();
    return shard.get(key);
  }

  static const String key_Name = "name";
  static const String key_ID = "id";
}
