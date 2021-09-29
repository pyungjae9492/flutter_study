import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaterialFlutterApp(),
    );
  }
}

class MaterialFlutterApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialFlutterApp();
  }

}

class _MaterialFlutterApp extends State<MaterialFlutterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PJ's App")),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              const Icon(Icons.analytics),
              const Text('Hi'),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
          ),
        )
      ),
    );
  } 
}