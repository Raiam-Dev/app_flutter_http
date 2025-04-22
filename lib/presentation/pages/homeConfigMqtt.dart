import 'package:app_http/core/utils/mqttCallbacks/mqtt_connection.dart';
import 'package:flutter/material.dart';

class Homeconfig extends StatefulWidget {
  const Homeconfig({super.key});

  @override
  State<Homeconfig> createState() => _HomeconfigState();
}

class _HomeconfigState extends State<Homeconfig> {
  final TextEditingController _controllerServer = TextEditingController();
  final TextEditingController _controllerPorta = TextEditingController();
  final _carregar = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Configuracion MQTT Sever",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextField(
                controller: _controllerServer,
                decoration: InputDecoration(label: Text("Server")),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controllerPorta,
                decoration: InputDecoration(label: Text("Porta")),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: () async {
                    _carregar.value = !_carregar.value;
                    bool response = await conectar(
                      _controllerServer.text,
                      int.parse(_controllerPorta.text),
                    );
                    _carregar.value = response;
                    response
                        ? null
                        : Navigator.pushNamed(context, "HomePainel");
                  },
                  child: AnimatedBuilder(
                    animation: _carregar,
                    builder: (BuildContext context, _) {
                      return _carregar.value
                          ? SizedBox(
                            width: 10,
                            height: 10,
                            child: Center(
                              child: CircularProgressIndicator(strokeWidth: 3),
                            ),
                          )
                          : Text(
                            "Conectar",
                            style: TextStyle(color: Colors.white),
                          );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
