import 'package:app_http/core/json_tests/lists_json.dart';
import 'package:app_http/core/utils/mqttCallbacks/callback_publicar.dart';
import 'package:flutter/material.dart';

class HomePainel extends StatefulWidget {
  const HomePainel({super.key});

  @override
  State<HomePainel> createState() => _BodyTesteState();
}

class _BodyTesteState extends State<HomePainel> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: jsonData.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text("${jsonData[index]['title']}"),
            subtitle: Text("${jsonData[index]['topic']}"),
            trailing: TextButton(
              onPressed: () {
                jsonData[index]['horario'] = DateTime.now().toString();
                publicar(
                  jsonData[index]['value'],
                  jsonData[index]['port'],
                  jsonData[index]['topic'],
                  jsonData[index]['horario'],
                );
              },
              child: Icon(Icons.send),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
