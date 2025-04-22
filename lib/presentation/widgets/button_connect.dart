import 'package:app_http/core/globals/variaveis_globais.dart';
import 'package:app_http/core/utils/mqttCallbacks/mqtt_connection.dart';
import 'package:flutter/material.dart';

class ButtonConnect extends StatefulWidget {
  const ButtonConnect({super.key});

  @override
  State<ButtonConnect> createState() => _ButtonConnectState();
}

class _ButtonConnectState extends State<ButtonConnect> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(overlayColor: Colors.transparent),
      onPressed: () async {
        await conectar("", 12);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 100,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 5),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: ValueListenableBuilder(
                        valueListenable: conectado,
                        builder: (context, conectado, _) {
                          return conectado == false
                              ? Card(color: Colors.red)
                              : Card(color: Colors.greenAccent);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: conectado,
                builder: (context, conectado, _) {
                  return conectado == false
                      ? Icon(Icons.connect_without_contact_rounded, size: 50)
                      : CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
