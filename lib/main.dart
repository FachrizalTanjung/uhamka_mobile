import 'package:flutter/material.dart';
import 'package:uhamka_mobile/page/bimbingan_skripsi_page.dart';
import 'package:uhamka_mobile/page/dashboard_page.dart';
import 'package:uhamka_mobile/page/data_dosen_page.dart';
import 'package:uhamka_mobile/page/data_mahasiswa_page.dart';
import 'package:uhamka_mobile/page/jadwal_matakuliah_page.dart';
import 'package:uhamka_mobile/page/login_page.dart';
import 'package:uhamka_mobile/page/nilai_mahasiswa_page.dart';
import 'package:uhamka_mobile/page/visi_misi_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    DashboardPage.tag: (context) => DashboardPage(),
    VisiMisiPage.tag: (context) => VisiMisiPage(),
    DataDosenPage.tag: (context) => DataDosenPage(),
    DataMahasiswaPage.tag: (context) => DataMahasiswaPage(),
    JadwalMatakuliahPage.tag: (context) => JadwalMatakuliahPage(),
    BimbinganSkripsiPage.tag: (context) => BimbinganSkripsiPage(),
    NilaiMahasiswaPage.tag: (context) => NilaiMahasiswaPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UHAMKA Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LoginPage(),
      home: DashboardPage(),
      routes: routes,
    );
  }
}
