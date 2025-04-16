import 'package:app_http/core/utils/mqtt_connection.dart';
import 'package:mqtt_client/mqtt_client.dart';

void onDisconnected() {
  if (client.connectionStatus?.disconnectionOrigin !=
      MqttDisconnectionOrigin.solicited) {}
}
