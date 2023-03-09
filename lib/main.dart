import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:workmanager_demo/examplePage.dart';

/*
const String taskName = "DemoTask";
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    switch (taskName) {
      case 'DemoTask':
        sendinDataToTask();
        break;
      default:
    }
    return Future.value(true);
  });
}

sendinDataToTask() {
  print("Hi Demoo work");
}*/

void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );*/
  runApp(const ExampleApp());
}

void startCallBack() {
  FlutterForegroundTask.setTaskHandler(TestTaskHandler());
}

int counter = 0;

class TestTaskHandler extends TaskHandler {
  SendPort? _sendPort;
  int _eventCount = 0;
  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
    await FlutterForegroundTask.clearAllData();
    // TODO: implement onDestroy
    throw UnimplementedError();
  }

  @override
  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) {
    throw UnimplementedError();
  }

  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    _sendPort = sendPort;
    // final customData = await FlutterForegroundTask.getData(key: 'customData');
    // print("Custom Data: ${customData}");

    var tastNumber = 0;
    Timer.periodic(Duration(seconds: 5), (timer) {
      counter = tastNumber + 1;

      print("My name is Robin and tast number: ${tastNumber++}}");
    });

    // TODO: implement onStart
    throw UnimplementedError();
  }

  @override
  void onButtonPressed(String id) {
    print("OnButtonPressed>>>>>$id");

    // TODO: implement onButtonPressed
    super.onButtonPressed(id);
  }

  /*@override
  void onNotificationPressed() {
    FlutterForegroundTask.launchApp("/resume-route");
    _sendPort?.send("onNotificationPressed");
    // TODO: implement onNotificationPressed
    super.onNotificationPressed();
  }*/
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ExamplePage(),
        '/resume-route': (context) => ResumeRoutePage()
      },
    );
  }
}

class ResumeRoutePage extends StatelessWidget {
  const ResumeRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Resume Route'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Navigate back to first route when tapped.
              Navigator.of(context).pop();
            },
            child: const Text('Go back!'),
          ),
        ));
  }
}

/*

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
*/
