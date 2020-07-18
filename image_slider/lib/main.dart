import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';


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
      home: MyHomePage(title: 'imageslider'),
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
 

  @override
  Widget build(BuildContext context) {

   Widget show = Container(
     child: Carousel(
       images: [
         AssetImage("images/1.jpg"),
         AssetImage("images/2.jpg"),
         AssetImage("images/f1.png"),
       ],
       dotSize: 6.2,
       indicatorBgPadding: 1,
       dotColor: Colors.red,
       autoplay: true,
     ),
   );

   
   
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center( child:Container(
        height:250,
        width:double.infinity,
        color: Colors.red,
        child:show,
      ), ),
    );
  }
}
