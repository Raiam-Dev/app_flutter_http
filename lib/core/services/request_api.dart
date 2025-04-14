import 'dart:convert';
import 'package:app_http/data/models/mapper_json.dart';
import 'package:http/http.dart' as http;

Future<User> requestApi() async {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/todos/10");

  var response = await http.get(url);

  if (response.statusCode == 200) {
    dynamic jsondecoder = jsonDecode(response.body);
    User userclient = User.fromMap(jsondecoder);
    return userclient;
  } else {
    throw Exception("Erro ao com servidor");
  }
}
