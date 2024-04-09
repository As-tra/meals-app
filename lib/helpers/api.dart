import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'There an Error with the Get request Status code ${response.statusCode}');
    }
  }
}
