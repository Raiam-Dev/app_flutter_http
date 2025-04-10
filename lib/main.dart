import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  String imagem = "images/brenda.jpg";

  Future<dynamic> requestApi() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var json_decoder = jsonDecode(response.body);
      return json_decoder;
    } else {
      throw Exception("Erro ao com servidor");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B2A),
      appBar: AppBar(
        title: Text(
          "New Bank",
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
              "https://static1.purepeople.com.br/articles/9/22/72/39/@/2616689-flavia-pavanelli-e-brenda-na-novela-as-580x0-3.jpg",
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.width * 0.50,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print(requestApi());
        },
      ),
    );
  }
}
