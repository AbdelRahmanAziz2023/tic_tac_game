import 'package:flutter/material.dart';
import 'package:tic_tac/HomePage.dart';
void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode:ThemeMode.dark,
      theme:ThemeData(
        primaryColor:Colors.black12,
        canvasColor: Colors.white,
        primaryColorDark: Colors.deepOrange,
        primaryColorLight: Colors.tealAccent,

      ),
      darkTheme:ThemeData(primaryColor:Colors.white,
          canvasColor: Colors.black12,
          primaryColorDark: Colors.deepOrange,
        primaryColorLight: Colors.tealAccent,

      ),
      home: MyHomePage(),
    );
  }
}

