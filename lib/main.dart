import 'package:flutter/material.dart';
import './mydrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PegasusSearch",
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: MyDrawer(),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("img/logo_nan.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 150.0,
                height: 150.0,
                child: Image.asset("img/logo_nan.png"),

              ),
              Text("NaN Search",style: TextStyle(fontSize: 20.0,color:Colors.white),),
              Text("By Black Pegasus@Shell",style: TextStyle(fontSize: 15.0,color:Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
