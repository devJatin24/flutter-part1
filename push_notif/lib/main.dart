import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
 
 String value="helo";
FirebaseMessaging firebaseMessaging=new FirebaseMessaging();
@override
  void initState() {
    firebaseMessaging.configure(
onLaunch: (Map<String,dynamic>msg){
  print("launch");
},

onMessage: (Map<String,dynamic>msg){
  print("message");
},

onResume: (Map<String,dynamic>msg){
  print("resume");
},

    );
    
firebaseMessaging.requestNotificationPermissions(
  const IosNotificationSettings(sound: true, badge: true, alert: true));

// firebaseMessaging.onIosSettingsRegistered.listen(IosNotificationSettings(
//   print("ios setting")
// ));
firebaseMessaging.getToken().then((token){

  update(token);
});

 
}
update(String token){
 print(token);
 value=token;
 setState(() {
   
 });
     }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:Text(value),
       ),
    );
  }
}
