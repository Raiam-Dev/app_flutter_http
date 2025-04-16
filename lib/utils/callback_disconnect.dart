import 'package:app_http/utils/mqtt_connection.dart';
import 'package:app_http/utils/variaveis_globais/variaveis_globais.dart';

void disconnect() {
  client.disconnect();
  conectado = false;
}
