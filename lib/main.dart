import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
var ip = "192.168.3.100";
var port = "3000";
Future<void> SendRequest(String url) async {
  var request = await HttpClient().getUrl(Uri.parse(url));
  var response = await request.close();
  var responseBodyText = await utf8.decodeStream(response);



  print(responseBodyText);
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iot_room',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
      ),
      home: MyHomePage(title: ''),

    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
        title: Text(widget.title),
      ),

        body :Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [           Expanded(child : Container (width: 140,child : OutlinedButton.icon( icon : Icon(Icons.flashlight_on), onPressed: (){SendRequest("http://"+ip+":"+port+"/light-on");},   label: Text("照明ON"),))),
                                Expanded(child : Container (width: 140,child : OutlinedButton.icon( icon : Icon(Icons.flashlight_off),onPressed: (){SendRequest("http://"+ip+":"+port+"/light-off");},  label: Text("照明OFF"),))),
                                Expanded(child : Container (width: 140,child : OutlinedButton.icon( icon : Icon(Icons.nightlight),    onPressed: (){SendRequest("http://"+ip+":"+port+"/light-night");},label: Text("照明常夜灯"),))),
                                Expanded(child : Container (width: 140,child : OutlinedButton.icon( icon : Icon(Icons.wb_sunny),      onPressed: (){SendRequest("http://"+ip+":"+port+"/light-full");}, label: Text("照明全灯"),))),
                                Expanded(child : Container (width: 140,child : OutlinedButton.icon( icon : Icon(Icons.add),           onPressed: (){SendRequest("http://"+ip+":"+port+"/light-up");},   label: Text("照明UP"),))),
                                Expanded(child : Container (width: 140,child : OutlinedButton.icon( icon : Icon(Icons.remove),        onPressed: (){SendRequest("http://"+ip+":"+port+"/light-down");}, label: Text("照明DOWN"),)))]
    ));
  }

}

