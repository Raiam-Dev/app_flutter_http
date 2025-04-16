import 'dart:convert';

import 'package:app_http/core/utils/mqtt_connection.dart';
import 'package:mqtt_client/mqtt_client.dart';

void publicar() {
  Map<String, dynamic> mensagem = {"porta": 13, "value": 1};

  String json_string = jsonEncode(mensagem);

  final builder = MqttClientPayloadBuilder();
  builder.addString(json_string);

  const topico = 'request/27';
  client.publishMessage(topico, MqttQos.atLeastOnce, builder.payload!);
}
