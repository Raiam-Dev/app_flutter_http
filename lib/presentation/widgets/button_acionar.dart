import 'package:flutter/material.dart';

class ButtonAcionar extends StatefulWidget {
  const ButtonAcionar({super.key});

  @override
  State<ButtonAcionar> createState() => _ButtonAcionarState();
}

class _ButtonAcionarState extends State<ButtonAcionar> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(overlayColor: Colors.transparent),
      onPressed: () {},
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 100,
        child: Card(child: Text('Conectar')),
      ),
    );
  }
}
