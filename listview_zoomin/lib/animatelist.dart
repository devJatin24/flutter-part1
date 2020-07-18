import 'package:flutter/material.dart';

class AnimateList extends StatefulWidget {
  AnimateList({Key key}) : super(key: key);

  @override
  _AnimateListState createState() => _AnimateListState();
}

class _AnimateListState extends State<AnimateList> {
  PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(

        initialPage: currentPage, keepPage: false, viewportFraction: 1,

        );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize  = MediaQuery.of(context).size;
    return Scaffold(
      body:   Container(
            height: screenSize.height,
            width: screenSize.width,
              color: Colors.red,
              child: PageView.builder(

                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                
                  controller: _pageController,
                  itemBuilder: (context, index) => animatedBuilder(index, screenSize))),
        
      
    );
  }

  Widget animatedBuilder(int index, Size size) {
    var _width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 1;
          if (_pageController.position.haveDimensions) {
            value = _pageController.page - index;
            print("1st value is: $value");
            value = (1 - value.abs() * 0.5).clamp(0.0, 1.0);
            print(" id is ${1 - value.abs()}");
          }
          print("3st value is: $value");
          return Center(
            child: SizedBox(
                height: Curves.easeOut.transform(value) * size.height*0.6,
                width: Curves.easeInCubic.transform(value) * size.width*0.8 ,
            //  width: double.infinity,
                child: child),
          );
        },
        //bolo
        child: Container(

          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 20),
         // color: Colors.yellow,
color: index % 2 == 0 ? Colors.yellow : Colors.green,
          child: Text("data"),
        ));
  }
}
