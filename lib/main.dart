import 'package:app_http/Mapper/mapper_json.dart';
import 'package:flutter/material.dart';
import 'functionsApi/api_teste.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Device Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int dadoEsquerdo = 1;
  int dadoDireito = 1;
  User? result;

  void carregarApi() async {
    User resultado = await requestApi();
    setState(() {
      result = resultado;
    });
  }

  void gerarDados() {
    dadoDireito = Random().nextInt(6) + 1;
    dadoEsquerdo = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B2A),
      appBar: AppBar(
        title: Text(
          "Jogo Dado",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "PatuaOne",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(52, 5, 1, 1),
        actions: [
          CircleAvatar(
            foregroundImage: NetworkImage(
              "https://wallpapers.com/images/featured-full/instagram-logo-vector-png-ir8f58dvmxlfkgac.png",
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            result != null
                ? Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  color: const Color.fromARGB(255, 26, 29, 31),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.message,
                            color: Colors.greenAccent,
                          ),
                          title:
                              result == null
                                  ? Text(
                                    'Details:',
                                    style: TextStyle(color: Colors.white),
                                  )
                                  : Text(
                                    'Details: ${result!.title}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                        ),
                      ],
                    ),
                  ),
                )
                : Center(
                  child: Text(
                    "Atualizar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        gerarDados();
                      });
                    },
                    child: Image.asset("images/dado$dadoEsquerdo.png"),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        gerarDados();
                      });
                    },
                    child: Image.asset("images/dado$dadoDireito.png"),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                final player = AudioPlayer();
                player.setSource(AssetSource('music/nota1.wav'));
              },
              child: Text("Clique"),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          carregarApi();
        },
        child: Icon(Icons.restart_alt_outlined),
      ),
    );
  }
}
