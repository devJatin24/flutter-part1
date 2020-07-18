import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("json local data"),
        ),
        body:  Container(
          child:  Center(
            child:  FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString(
                  'load_json/person.json'),
              builder: (context, snapshot) {
                var myData = json.decode(snapshot.data.toString());
                return  ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child:  Row(children: <Widget>[

                        Container(
                          height: 25,
                          width: 25,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(),
                          ),
                          child: Text(myData[index]['sno']),
                        ),

                        SizedBox(width: 15,),


                        Container(
                          alignment: Alignment.topRight,
                          child: Text("name is " + myData[index]['name']),
                        ),

                        SizedBox(width: 5,),
                         Container(
                          child: Column(children: <Widget>[
for(var i in myData[index]['subject'] )

                            Text("course is "+i),
                          ],),
                        )


                      ],),
                    );
                  },
                  itemCount: myData == null ? 0 : myData.length,);
              },
            ),
          ),
        )
    );
  }
}
