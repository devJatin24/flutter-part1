 import 'package:flutter/material.dart';
 import 'package:shared_preferences/shared_preferences.dart';

import 'Second.dart';

 void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

 class MyHomePage extends StatefulWidget {
   MyHomePage({Key key, this.title}) : super(key: key);

 

   final String title;

   @override
   _MyHomePageState createState() => _MyHomePageState();
 }

 class _MyHomePageState extends State<MyHomePage> {
 
  void setValues() async {
     SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
     // set values

     sharedPrefs.setString('user_name', 'flutterStart');
     sharedPrefs.setString('user_id', '1');
     print('Values Set in Shared Prefs!!');
   }
  

   void getValues() async {
     print('Getting Values from shared Preferences');
     SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
     String user_name = sharedPrefs.getString('user_name');
      String user_id = sharedPrefs.getString('user_id');
     

      print('user_name: ${user_name}');
      print('user_id: ${user_id}');
    
   }

   @override
   Widget build(BuildContext context) {
   
     return Scaffold(
       appBar: AppBar(
       
         title: Text(widget.title),
       ),
       body: Center(
         child: Column(
         children: <Widget>[
           Container(child: RaisedButton(
             child: Text('Set Values'), textColor: Colors.white,color: Colors.blueAccent,
             onPressed: () async{
               setValues();
             },
           ),),

             Container(child: RaisedButton(
             child: Text('Get Values'), textColor: Colors.white,color: Colors.blueAccent,
             onPressed: () async{
               getValues();
             },
           ),),

         ],
       ),
           ),
        );
   }
 }
