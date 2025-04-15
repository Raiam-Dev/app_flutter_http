import 'dart:convert';

import 'package:app_http/utils/mqtt_connection.dart';
import 'package:mqtt_client/mqtt_client.dart';

void publicar() {
  Map<String, dynamic> mensagem = {
    "dispositivo": "valvula_acionamento_solenoide",
    "port": "Q0.0",
    "value": 0,
  };

  String json_string = jsonEncode(mensagem);

  final builder = MqttClientPayloadBuilder();
  builder.addString(json_string);

  const topico = 'Dart/Mqtt_client/testtopic';
  client.publishMessage(topico, MqttQos.atLeastOnce, builder.payload!);
}
