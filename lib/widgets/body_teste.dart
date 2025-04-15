import 'package:app_http/utils/callback_disconnect.dart';
import 'package:app_http/utils/callback_publicar.dart';
import 'package:app_http/utils/mqtt_connection.dart';
import 'package:flutter/material.dart';

bool conectado = false;

class BodyTeste extends StatefulWidget {
  const BodyTeste({super.key});

  @override
  State<BodyTeste> createState() => _BodyTesteState();
}

class _BodyTesteState extends State<BodyTeste> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 500,
            height: 200,
            child: Card(
              color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color:
                                conectado == true
                                    ? const Color.fromARGB(255, 0, 255, 8)
                                    : const Color.fromARGB(255, 243, 16, 0),
                          ),
                          width: 15,
                          height: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                          width: 150,
                          height: 35,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                255,
                                255,
                                255,
                              ),
                            ),
                            onPressed: () {
                              publicar();
                            },
                            child: Icon(Icons.publish_sharp),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 25,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              disconnect();
                            });
                          },
                          child: Text("Desconectar"),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        height: 25,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                          ),
                          onPressed: () async {
                            await conectar();
                            setState(() {});
                          },
                          child: Text("Conectar"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
