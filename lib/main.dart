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
  String imagem = "images/brenda.jpg";
  int _saldo = 0;

  void enviar() {
    setState(() {
      if (imagem == "images/brenda.jpg") {
        imagem = "images/logoTec.png";
      } else {
        imagem = "images/brenda.jpg";
      }
    });
  }

  void saldoenviar() {
    setState(() {
      _saldo++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B2A),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: CircleAvatar(
                radius: 50,
                foregroundImage: AssetImage(imagem),
              ),
              onTap: () {
                print("clicol");
              },
            ),
            Text(
              "Geovana Silva",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
              ),
            ),
            SizedBox(height: 10),
            Text(
              "ENGENHEIRA DE HARDWARE",
              style: TextStyle(
                color: Colors.deepOrange.shade100,
                fontFamily: "PatuaOne",
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                children: [
                  Icon(Icons.phone, color: Color(0xFF0D1B2A), size: 25),
                  SizedBox(width: 10),
                  Text(
                    "+55 28999324531",
                    style: TextStyle(
                      color: Color(0xFF0D1B2A),
                      fontFamily: "PatuaOne",
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                children: [
                  Icon(Icons.email, color: Color(0xFF0D1B2A), size: 25),
                  SizedBox(width: 10),
                  Text(
                    "geovanasilva@gmail.com",
                    style: TextStyle(
                      color: Color(0xFF0D1B2A),
                      fontFamily: "PatuaOne",
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                enviar();
              },
              child: Text("Entrar", style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
                minimumSize: WidgetStateProperty.all<Size>(Size(310, 40)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
