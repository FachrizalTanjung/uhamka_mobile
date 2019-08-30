import 'package:flutter/material.dart';
import 'package:uhamka_mobile/dashboard_page.dart';
import 'package:uhamka_mobile/login_page.dart';
import 'package:uhamka_mobile/visi_misi_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    DashboardPage.tag: (context) => DashboardPage(),
    VisiMisiPage.tag: (context) => VisiMisiPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
