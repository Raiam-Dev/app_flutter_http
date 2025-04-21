import 'package:app_http/core/utils/mqttCallbacks/mqtt_connection.dart';
import 'package:flutter/material.dart';

class Homeconfig extends StatelessWidget {
  const Homeconfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configuracion MQTT"), centerTitle: true),
      body: ElevatedButton(
        onPressed: () async {
          await conectar();
        },
        child: Text("Connectar Mqtt"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'HomePainel'),
      ),
    );
  }
}
