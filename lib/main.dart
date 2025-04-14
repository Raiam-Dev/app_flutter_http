import 'package:app_http/core/utils/carregar_api.dart';
import 'package:app_http/presentation/pages/screen_page.dart';
import 'package:flutter/material.dart';

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
      body: ScreenPage(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          setState(() {
            chamarApi();
          });
        },
        child: Icon(Icons.restart_alt_outlined),
      ),
    );
  }
}
