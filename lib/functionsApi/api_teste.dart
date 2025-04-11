import 'dart:convert';
import 'package:app_http/Mapper/mapper_json.dart';
import 'package:http/http.dart' as http;

Future<User> requestApi() async {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");

  var response = await http.get(url);

  if (response.statusCode == 200) {
    dynamic jsondecoder = jsonDecode(response.body);
    User user_client = User.fromMap(jsondecoder);
    return user_client;
  } else {
    throw Exception("Erro ao com servidor");
  }
}
