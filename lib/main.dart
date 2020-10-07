import 'package:flutter/material.dart';
import 'package:news_app/pages/NewsDetail.dart';
import 'package:news_app/pages/NewsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Navegación'),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/' : (context) => NewsPage(),
        '/detalle': (context) => NewsDetail()
      },
    );
  }
}
