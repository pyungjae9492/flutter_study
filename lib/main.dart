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
      home: WidgetApp(),
    );
  }
}


/// 4-1 Stateful Widget 생성해보기 ///
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

class WidgetApp extends StatefulWidget{
  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text('flutter'),
                TextField(keyboardType: TextInputType.number, controller: value1),
                TextField(keyboardType: TextInputType.number, controller: value2),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      int result = int.parse(value1.value.text) + int.parse(value2.value.text);
                      sum = '$result';
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      Text('더하기'),
                    ],
                )),
                Text('$sum', style: TextStyle(fontSize:20)),
                Text('$value1', style: TextStyle(fontSize:20))
              ],
            ),
          ),
        ),
      );
  }
}