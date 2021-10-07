import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HttpApp();
}

class _HttpApp extends State<HttpApp> {
  String result = '';
  List data = [];
  TextEditingController _editingController = new TextEditingController();///// 여기서는 어떻게?

  @override
  void initState() {
    super.initState();
    // data = new List();
    _editingController = new TextEditingController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        child: Center(
          child: data.length == 0
              ? TextField(
                  controller: _editingController,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(hintText: '검색어를 입력하세요'),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                          child: Row(
                        children: <Widget>[
                          Image.network(
                            data[index]['thumbnail'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.contain,
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width - 150,
                                child: Text(
                                  data[index]['title'].toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text('저자 : ${data[index]['authors'].toString()}'),
                              Text(
                                  '가격 : ${data[index]['sale_price'].toString()}'),
                              Text('판매중 : ${data[index]['status'].toString()}'),
                            ],
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      )),
                    );
                    // );
                  },
                  itemCount: data.length),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = 'https://dapi.kakao.com/v3/search/book?'
              'target=title&query=${_editingController.value.text}';

    var response = await http.get(Uri.parse(Uri.encodeFull(url)),
        headers: {"Authorization": "KakaoAK 132c3626d63806fd15a9c0a734f35819"});
    print(response.body);
    setState(() {
      var dataConvertedToJson = json.decode(response.body);
      List result = dataConvertedToJson['documents'];
      data.addAll(result);
    });
    return response.body;
  }
}
