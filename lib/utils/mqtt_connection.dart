import 'dart:io';
import 'package:app_http/utils/callback_onConnect.dart';
import 'package:app_http/utils/callback_onDisconnect.dart';
import 'package:app_http/widgets/body_teste.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

final client = MqttServerClient('test.mosquitto.org', 'raiam');

Future<void> conectar() async {
  client.logging(on: false);
  client.setProtocolV311();
  client.keepAlivePeriod = 60;
  client.autoReconnect = true;

  client.onDisconnected = onDisconnected;
  client.onConnected = onConnected;

  try {
    await client.connect();
    conectado = true;
  } on NoConnectionException catch (_) {
    client.disconnect();
    return;
  } on SocketException catch (_) {
    client.disconnect();
    return;
  }

  if (client.connectionStatus!.state == MqttConnectionState.connected) {
  } else {
    client.disconnect();
  }
}
