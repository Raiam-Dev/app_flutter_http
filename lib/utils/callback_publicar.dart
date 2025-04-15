import 'package:app_http/utils/mqtt_connection.dart';
import 'package:mqtt_client/mqtt_client.dart';

void publicar(String mensagem) {
  final builder = MqttClientPayloadBuilder();
  builder.addString(mensagem);

  const topico = 'Dart/Mqtt_client/testtopic';
  client.publishMessage(topico, MqttQos.atLeastOnce, builder.payload!);
}
