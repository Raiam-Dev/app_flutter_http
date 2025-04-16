import 'package:app_http/cores/cores_globais.dart';
import 'package:app_http/utils/callback_publicar.dart';
import 'package:app_http/utils/mqtt_connection.dart';
import 'package:app_http/utils/variaveis_globais/variaveis_globais.dart';
import 'package:flutter/material.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({super.key});

  @override
  State<BodyHome> createState() => _BodyTesteState();
}

class _BodyTesteState extends State<BodyHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () async {
                conectando = true;
                setState(() {});
                await conectar();
                setState(() {
                  conectando = false;
                });
              },
              style: TextButton.styleFrom(overlayColor: transparent),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 5),
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: conectado == true ? green : red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      conectando == false
                          ? Icon(Icons.connect_without_contact, size: 40)
                          : CircularProgressIndicator(),
                      Text(
                        "Connect",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                if (conectado == true) {
                  publicar();
                } else {}
              },
              style: TextButton.styleFrom(overlayColor: transparent),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      conectado == false
                          ? Icon(Icons.block_flipped, size: 40)
                          : Icon(Icons.publish_outlined, size: 40),
                      Text(
                        "publish",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
