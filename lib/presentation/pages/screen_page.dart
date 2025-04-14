import 'package:app_http/core/constants/global_cors.dart';
import 'package:app_http/core/constants/global_variavel.dart';
import 'package:app_http/core/utils/gerador_dados.dart';
import 'package:app_http/presentation/pages/widgets/modelos_teclado.dart';
import 'package:flutter/material.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            result != null
                ? Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  color: dark,
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
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(1),
              color: dark,
              width: MediaQuery.of(context).size.width * 0.94,
              height: MediaQuery.of(context).size.height * 0.30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  teclado(nota: 1, cor: red),
                  teclado(nota: 2, cor: pink),
                  teclado(nota: 3, cor: purple),
                  teclado(nota: 4, cor: green),
                  teclado(nota: 5, cor: greenLight),
                  teclado(nota: 6, cor: yellow),
                  teclado(nota: 7, cor: blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
