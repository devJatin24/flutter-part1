import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "TextField",
    home: t(),
  ));
}

class t extends StatefulWidget {
  // t({Key key}) : super(key: key);

  @override
  _tState createState() => _tState();
}

class _tState extends State<t> {
  @override
  Widget build(BuildContext context) {
    TextEditingController as=TextEditingController();
    return Scaffold(
      body: Container(
        child: Column(children: <Widget>[
          Padding(padding:EdgeInsets.only(top:25,bottom: 15),
          child: TextField(
            controller: as,
          ),
          ),
          FlatButton(onPressed: (){
           String a=as.text;
           print("output is: $a");
          }, child: Text("done",textScaleFactor: 2,)),
        
        ],),
      ),

    );
  }

  
}
