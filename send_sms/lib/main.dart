import 'package:flutter/material.dart';
//import 'package:flutter_sms/flutter_sms.dart';

//import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';


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
      home: MyHomePage(title: 'message'),
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
TextEditingController num=TextEditingController();
TextEditingController msg=TextEditingController();

String Msg,Num;

static const platform = const MethodChannel('sendSms');

  Future<Null> sendSms1(String N,String M)async {
    print("SendSMS");
    try {
      final String result = await platform.invokeMethod('send',<String,dynamic>{"phone":N,"msg":M}); //Replace a 'X' with 10 digit phone number
      print(result);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: <Widget>[

          TextField(
            controller: num,
          ),

          Padding(padding: EdgeInsets.all(35),
          child: TextField(
            controller: msg,
          ),),
          RaisedButton(child: Text("send"),onPressed: (){
            Num=num.text;
            Msg=msg.text;
            print(Msg+Num);
          sendSms1(Num, Msg);
          },),

          

        ],),
      ),
    );
  }
}
