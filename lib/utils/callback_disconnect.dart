import 'package:app_http/utils/mqtt_connection.dart';
import 'package:app_http/widgets/body_teste.dart';

void disconnect() {
  client.disconnect();
  conectado = false;
}
