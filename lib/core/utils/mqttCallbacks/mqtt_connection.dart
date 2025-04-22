import 'package:app_http/core/globals/variaveis_globais.dart';
import 'package:app_http/core/utils/mqttCallbacks/callback_onConnect.dart';
import 'package:app_http/core/utils/mqttCallbacks/callback_onDisconnect.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

String serverMqtt = '';
final client = MqttServerClient(serverMqtt, 'raiam');

Future<bool> conectar(String server, int porta) async {
  serverMqtt = server;
  client.logging(on: false);
  client.setProtocolV311();
  client.keepAlivePeriod = 60;
  client.pongCallback = () {
    print("✔ Broker respondeu com PINGRESP, conexão OK.");
    conectado.value = true;
  };
  client.autoReconnect = false;
  client.port = porta;

  client.onDisconnected = onDisconnected;
  client.onConnected = onConnected;

  try {
    await Future.delayed(const Duration(seconds: 2));
    await client.connect();

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      return false;
    } else {
      client.disconnect();
      print('Deconectado');
      conectado.value = !conectado.value;
      return true;
    }
  } catch (erro) {
    print(erro);
  }
  ;
  return false;
}
