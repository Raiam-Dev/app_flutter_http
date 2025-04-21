import 'package:app_http/presentation/pages/homeConfig.dart';
import 'package:app_http/presentation/pages/home_painel.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (BuildContext context) => Homeconfig(),
        "HomePainel": (BuildContext context) => MyHomePage(),
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
      appBar: AppBar(
        title: Text(
          "MQTT ESP-32",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [],
      ),
      body: SafeArea(child: HomePainel()),
    );
  }
}
