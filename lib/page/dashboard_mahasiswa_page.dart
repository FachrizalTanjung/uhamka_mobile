import 'package:flutter/material.dart';
import 'package:uhamka_mobile/model/Login.dart';
import 'package:uhamka_mobile/page/bimbingan_skripsi_mahasiswa_page.dart';
import 'package:uhamka_mobile/page/data_mahasiswa_page.dart';
import 'package:uhamka_mobile/page/isi_krs_page.dart';
import 'package:uhamka_mobile/page/jadwal_matakuliah_page.dart';
import 'package:uhamka_mobile/page/kegiatan_mahasiswa_page.dart';
import 'package:uhamka_mobile/page/lihat_nilai_page.dart';

class DashboardMahasiswaPage extends StatelessWidget {
  static String tag = 'dashboard-mahasiswa-page';
  final Login login;
  const DashboardMahasiswaPage({Key key, this.login}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(login.nama),
              accountEmail: Text('username@yahoo.com'),
              currentAccountPicture: CircleAvatar(
                child: FlutterLogo(
                  size: 42.0,
                ),
              ),
            ),
            ListTile(
              title: Text('Keluar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Colors.purple,
              image: DecorationImage(
                  image: AssetImage('assets/teknik.png'),
                  alignment: Alignment.topCenter),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: SizedBox(
                      width: 110,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(IsiKrsPage.tag);
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.calendar_today),
                            Text('Isi'),
                            Text('KRS'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: SizedBox(
                      width: 110,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(LihatNilaiPage.tag);
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.content_paste),
                            Text('Lihat'),
                            Text('Nilai'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: SizedBox(
                      width: 110,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(KegiatanMahasiswaPage.tag);
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.portrait),
                            Text('Kegiatan'),
                            Text('Mahasiswa'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: SizedBox(
                      width: 110,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(JadwalMatakuliahPage.tag);
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.add_alarm),
                            Text('Jadwal'),
                            Text('Mata Kuliah'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: SizedBox(
                      width: 110,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(DataMahasiswaPage.tag);
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.assignment_ind),
                            Text('Data'),
                            Text('Mahasiswa'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: SizedBox(
                      width: 110,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(BimbinganSkripsiMahasiswaPage.tag);
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.assignment),
                            Text('Bimbingan'),
                            Text('Skripsi'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
