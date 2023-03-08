import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'package:workmanager_demo/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String uniqueId = DateTime.now().second.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Work Manager Demo"),
      ),
      body: Center(
        child: OutlinedButton(
            onPressed: () async {
              await Workmanager().registerPeriodicTask(uniqueId, taskName,
                  frequency: Duration(seconds: 10));
            },
            child: Text("Task start")),
      ),
    );
  }
}
