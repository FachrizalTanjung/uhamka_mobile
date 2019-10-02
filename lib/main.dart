import 'package:flutter/material.dart';
import 'package:uhamka_mobile/page/bimbingan_skripsi_dosen_page.dart';
import 'package:uhamka_mobile/page/bimbingan_skripsi_mahasiswa_page.dart';
import 'package:uhamka_mobile/page/dashboard_dosen_page.dart';
import 'package:uhamka_mobile/page/dashboard_mahasiswa_page.dart';
// import 'package:uhamka_mobile/page/dashboard_page.dart';
import 'package:uhamka_mobile/page/data_dosen_page.dart';
import 'package:uhamka_mobile/page/data_mahasiswa_page.dart';
import 'package:uhamka_mobile/page/input_bimbingan_page.dart';
import 'package:uhamka_mobile/page/isi_krs_page.dart';
import 'package:uhamka_mobile/page/jadwal_matakuliah_page.dart';
import 'package:uhamka_mobile/page/kegiatan_mahasiswa_page.dart';
import 'package:uhamka_mobile/page/lihat_nilai_page.dart';
import 'package:uhamka_mobile/page/login_page.dart';
import 'package:uhamka_mobile/page/nilai_mahasiswa_page.dart';
import 'package:uhamka_mobile/page/visi_misi_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    // DashboardPage.tag: (context) => DashboardPage(),
    VisiMisiPage.tag: (context) => VisiMisiPage(),
    DataDosenPage.tag: (context) => DataDosenPage(),
    DataMahasiswaPage.tag: (context) => DataMahasiswaPage(),
    JadwalMatakuliahPage.tag: (context) => JadwalMatakuliahPage(),
    // BimbinganSkripsiPage.tag: (context) => BimbinganSkripsiPage(),
    BimbinganSkripsiDosenPage.tag: (context) => BimbinganSkripsiDosenPage(),
    BimbinganSkripsiMahasiswaPage.tag: (context) =>
        BimbinganSkripsiMahasiswaPage(),
    NilaiMahasiswaPage.tag: (context) => NilaiMahasiswaPage(),
    DashboardDosenPage.tag: (context) => DashboardDosenPage(),
    DashboardMahasiswaPage.tag: (context) => DashboardMahasiswaPage(),
    KegiatanMahasiswaPage.tag: (context) => KegiatanMahasiswaPage(),
    IsiKrsPage.tag: (context) => IsiKrsPage(),
    LihatNilaiPage.tag: (context) => LihatNilaiPage(),
    // InputBimbinganPage
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UHAMKA Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      // home: DashboardPage(),
      // home: BimbinganSkripsiMahasiswaPage(),
      // home: BimbinganSkripsiDosenPage(),
      // home: NilaiMahasiswaPage(),
      // home: LihatNilaiPage(),
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
