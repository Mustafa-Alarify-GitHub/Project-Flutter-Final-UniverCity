import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  // Get Date
  static getData(String url) async {
    try {
      var respones = await http.get(Uri.parse(url));

      if (respones.statusCode == 200) {
        var responsBody = jsonDecode(respones.body);
        return responsBody;
      } else {
        print("Error  ${respones.statusCode}");
      }
    } catch (e) {
      print("Error == ${e}");
    }
  }

  // Post  Date
  static postData(String url,Map Date) async {
    try {
      var respones = await http.post(Uri.parse(url),body: Date);

      if (respones.statusCode == 200) {
        var responsBody = jsonDecode(respones.body);
        return responsBody;

      } else {
        print("Error  ${respones.statusCode}");
      }
    } catch (e) {
      print("Error == ${e}");
    }
  }
}
