import 'dart:io';
import 'package:app_http/core/utils/callback_onConnect.dart';
import 'package:app_http/core/utils/callback_onDisconnect.dart';
import 'package:app_http/core/globals/variaveis_globais.dart';
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
