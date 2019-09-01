import 'package:flutter/material.dart';
import 'package:uhamka_mobile/dashboard_page.dart';
import 'package:uhamka_mobile/data_dosen_page.dart';
import 'package:uhamka_mobile/data_mahasiswa_page.dart';
import 'package:uhamka_mobile/login_page.dart';
import 'package:uhamka_mobile/visi_misi_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    DashboardPage.tag: (context) => DashboardPage(),
    VisiMisiPage.tag: (context) => VisiMisiPage(),
    DataDosenPage.tag: (context) => DataDosenPage(),
    DataMahasiswaPage.tag: (context) => DataMahasiswaPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UHAMKA Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
