import 'package:app_http/core/constants/global_variavel.dart';
import 'package:app_http/core/services/request_api.dart';
import 'package:app_http/data/models/mapper_json.dart';

void chamarApi() async {
  User resultado = await requestApi();
  result = resultado;
}
