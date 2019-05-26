import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp_cliente/homepage.dart';
import 'package:restaurapp_cliente/provider/provider.dart';
import 'package:restaurapp_cliente/screens/initial.dart';

import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (context) => MyProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            home: SplashScreen(
              seconds: 3,
              navigateAfterSeconds: new InitialPage(),
              title: new Text(
                'RestaurApp',
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,color: Colors.white),
              ),
              image: new Image.asset(
                  'assets/restaurapp.png'),
              gradientBackground: new LinearGradient(
                  colors: [Colors.deepOrange, Colors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              backgroundColor: Colors.white,
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 100.0,
              onClick: () => print("Flutter Egypt"),
              loaderColor: Colors.red,
            )));
  }
}


