import 'package:app_http/core/utils/mqtt_connection.dart';
import 'package:app_http/core/globals/variaveis_globais.dart';

void disconnect() {
  client.disconnect();
  conectado = false;
}
