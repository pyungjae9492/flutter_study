// import 'package:flutter/material.dart';
// import 'package:my_flutter_app/sub/firstPage.dart';
// import 'package:my_flutter_app/sub/secondPage.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }


// /// 4-1 Stateful Widget 생성해보기 ///
// class MaterialFlutterApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MaterialFlutterApp();
//   }

// }

// class _MaterialFlutterApp extends State<MaterialFlutterApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("PJ's App")),
//       floatingActionButton: FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
//       body: Container(
//         child: Center(
//           child: Column(
//             children: <Widget>[
//               const Icon(Icons.analytics),
//               const Text('Hi'),
//               ],
//               mainAxisAlignment: MainAxisAlignment.center,
//           ),
//         )
//       ),
//     );
//   } 
// }

// /// 4-3 계산기 만들어보기 /// 
// class WidgetApp extends StatefulWidget{
//   @override
//   _WidgetExampleState createState() => _WidgetExampleState();
// }

// class _WidgetExampleState extends State<WidgetApp> {
//   String sum = '';
//   TextEditingController value1 = TextEditingController();
//   TextEditingController value2 = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(title: const Text('Example')),
//         body: Container(
//           child: Center(
//             child: Column(
//               children: <Widget>[
//                 Padding(padding: EdgeInsets.all(10)),
//                 Text('flutter'),
//                 Padding(padding: EdgeInsets.all(10)),
//                 TextField(keyboardType: TextInputType.number, controller: value1),
//                 Padding(padding: EdgeInsets.all(10)),
//                 TextField(keyboardType: TextInputType.number, controller: value2),
//                 Padding(padding: EdgeInsets.all(10)),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       int result = int.parse(value1.value.text) + int.parse(value2.value.text);
//                       sum = '$result';
//                     });
//                   },
//                   child: Row(
//                     children: <Widget>[
//                       Icon(Icons.add),
//                       Text('더하기'),
//                     ],
//                 )),
//                 Padding(padding: EdgeInsets.all(10)),
//                 Text('$sum', style: TextStyle(fontSize:20)),
//                 Padding(padding: EdgeInsets.all(10)),
//               ],
//             ),
//           ),
//         ),
//       );
//   }
// }

// /// 5-1 탭 바로 화면 이동하기 ///
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: TabBarView(
//         children: <Widget>[WidgetApp(), MaterialFlutterApp()],
//         controller: controller,
//       ),
//       bottomNavigationBar: TabBar(tabs: <Tab>[
//         Tab(icon: Icon(Icons.looks_one, color: Colors.blue)),
//         Tab(icon: Icon(Icons.looks_two, color: Colors.red)),
//         ], controller: controller,
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     controller = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }