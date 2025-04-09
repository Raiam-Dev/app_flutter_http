import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Device Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Device Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF3E4C59),
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          Padding(padding: EdgeInsets.only(left: 10, right: 10), 
          child: Text("$_counter", style: TextStyle(fontSize: 20,color: Colors.white),
        ),)],
      ),
      backgroundColor: Color(0xFF1F1F2E),
      body:Center(child:Image(image:AssetImage("images/images-removebg-preview.png"),),),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Color(0xFF00BFA6),
        splashColor: Color(0xFF00BFA6),
        foregroundColor: Colors.white,
        tooltip: 'Contador',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
