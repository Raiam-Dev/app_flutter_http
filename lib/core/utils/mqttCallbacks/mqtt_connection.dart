import 'package:app_http/core/globals/variaveis_globais.dart';
import 'package:app_http/core/utils/mqttCallbacks/callback_onConnect.dart';
import 'package:app_http/core/utils/mqttCallbacks/callback_onDisconnect.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

final client = MqttServerClient('192.168.11.124', 'raiam');

Future<void> conectar() async {
  client.logging(on: false);
  client.setProtocolV311();
  client.keepAlivePeriod = 60;
  client.pongCallback = () {
    print("✔ Broker respondeu com PINGRESP, conexão OK.");
    conectado.value = true;
  };
  client.autoReconnect = false;
  client.port = 1884;

  client.onDisconnected = onDisconnected;
  client.onConnected = onConnected;

  try {
    conectado.value = !conectado.value;
    await client.connect();
    conectado.value = !conectado.value;

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      return;
    } else {
      client.disconnect();
      print('Deconectado');
      conectado.value = !conectado.value;
      return;
    }
  } catch (erro) {
    print(erro);
  }
  ;
}
