import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyBody extends StatefulWidget {
  @override
  createState() => new MyBodyState();
}

Future<String> str(int i) async {
  var url = Uri.parse("http://numbersapi.com/${i}/math");
  final response = await http.get(url);
  print(response.body);
  return response.body;
}


class MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context, i){
      return new ListTile(title: Row(children: [Expanded(child: Image.network("https://randomfox.ca/images/${i=i+1}.jpg")), Expanded(child: FutureBuilder<String>(future: str(i), builder: (BuildContext context, AsyncSnapshot<String> snapshot) {final theText = snapshot.data;if (snapshot.hasData) {return Text(theText ?? "");}return Text(theText ?? "");}))]));
    });
  }
}

void main() =>  runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(body: new Center(child: new MyBody(),))
    )
);