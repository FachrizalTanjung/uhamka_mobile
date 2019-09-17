import 'package:flutter/material.dart';
import 'package:uhamka_mobile/model/Login.dart';
import 'package:uhamka_mobile/page/bimbingan_skripsi_dosen_page.dart';
import 'package:uhamka_mobile/page/data_dosen_page.dart';
import 'package:uhamka_mobile/page/jadwal_matakuliah_page.dart';
import 'package:uhamka_mobile/page/nilai_mahasiswa_page.dart';

class DashboardDosenPage extends StatelessWidget {
  static String tag = 'dashboard-dosen-page';
  final Login login;
  const DashboardDosenPage({Key key, this.login}) : super(key: key);
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
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: SizedBox(
                      width: 110,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(DataDosenPage.tag);
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.supervised_user_circle),
                            Text('Data'),
                            Text('Dosen'),
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
                              .pushNamed(BimbinganSkripsiDosenPage.tag);
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
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: SizedBox(
                      width: 110,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(NilaiMahasiswaPage.tag);
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.book),
                            Text('Nilai'),
                            Text('Mahasiswa'),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
