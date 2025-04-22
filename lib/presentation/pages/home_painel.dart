import 'dart:convert';

import 'package:app_http/core/globals/variaveis_globais.dart';
import 'package:app_http/core/json_tests/lists_json.dart';
import 'package:flutter/material.dart';

class HomePainel extends StatefulWidget {
  const HomePainel({super.key});

  @override
  State<HomePainel> createState() => _BodyTesteState();
}

class _BodyTesteState extends State<HomePainel> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: jsonData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print(index);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.height * 0.03,
                            height: MediaQuery.of(context).size.width * 0.03,
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
                    Text("${jsonData[index]['port']}"),
                    Center(
                      child: Text(
                        "${jsonData[index]['title']}",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
