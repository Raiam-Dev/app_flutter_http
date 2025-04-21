import 'dart:convert';

import 'package:app_http/core/utils/mqttCallbacks/mqtt_connection.dart';
import 'package:mqtt_client/mqtt_client.dart';

void publicar(int valor, int porta, String topic, String hora) {
  Map<String, dynamic> mensagem = {
    "porta": porta,
    "value": valor,
    "horario": hora,
  };

  String jsonString = jsonEncode(mensagem);

  final builder = MqttClientPayloadBuilder();
  builder.addString(jsonString);

  client.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
}
