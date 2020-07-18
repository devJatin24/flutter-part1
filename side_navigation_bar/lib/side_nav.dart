import 'package:flutter/material.dart';
import 'profile.dart';

class side extends StatefulWidget {
  side({Key key}) : super(key: key);

  @override
  _sideState createState() => _sideState();
}

class _sideState extends State<side> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          width: double.infinity,
          color: Colors.red,
          padding: EdgeInsets.all(25),
          child: Center(
            child: Column(children: <Widget>[
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:DecorationImage(image:NetworkImage
                  ("https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",),fit: BoxFit.fill ),
                ),
                child: Container(alignment: Alignment.bottomRight,
                  child:Icon(Icons.add_circle,color: Colors.blue,),
                ),
              ),
              Text("CzccZ"),
            ],),
          ),
        ),

        ListTile(
          leading: Icon(Icons.add_circle),
          title: Text("dsa"),
          onTap: (){
            
                       Navigator.push(context, MaterialPageRoute(builder: (context) => profiles()),);
          },
        ),
ListTile(
          leading: Icon(Icons.add_circle),
          title: Text("dsa"),
        ),
        ListTile(
          leading: Icon(Icons.add_circle),
          title: Text("dsa"),
        ),


      ],),
    );
    
  }
}