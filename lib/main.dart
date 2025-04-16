import 'package:app_http/core/constants/cores_globais.dart';
import 'package:app_http/core/utils/callback_disconnect.dart';
import 'package:app_http/core/utils/mqtt_connection.dart';
import 'package:app_http/core/globals/variaveis_globais.dart';
import 'package:app_http/presentation/pages/home_login.dart';
import 'package:app_http/presentation/pages/home_painel.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
      routes: <String, WidgetBuilder>{
        'HomePainel': (BuildContext context) => MyHomePage(),
        '/': (BuildContext context) => HomeLogin(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(
          "MQTT ESP-32",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          conectado == true
              ? TextButton(
                onPressed: () {
                  disconnect();
                  conectado = false;
                  setState(() {});
                },
                child: Icon(Icons.pause_sharp, color: white, size: 20),
              )
              : TextButton(
                onPressed: () async {
                  conectando = true;
                  setState(() {});
                  await conectar();
                  setState(() {
                    conectando = false;
                  });
                },
                child: Icon(Icons.play_arrow, color: white, size: 20),
              ),
        ],
      ),
      body: HomePainel(),
    );
  }
}
