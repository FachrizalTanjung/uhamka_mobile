import 'package:flutter/material.dart';
import 'package:uhamka_mobile/data_dosen_page.dart';
import 'package:uhamka_mobile/data_mahasiswa_page.dart';
import 'package:uhamka_mobile/jadwal_matakuliah_page.dart';
import 'package:uhamka_mobile/visi_misi_page.dart';

class DashboardPage extends StatelessWidget {
  static String tag = 'dashboard-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Profil'),
              decoration: BoxDecoration(
                color: Colors.blue,
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
                  // Padding(
                  //   padding: EdgeInsets.all(4),
                  //   child: SizedBox(
                  //     width: 110,
                  //     child: RaisedButton(
                  //       onPressed: () {
                  //         Navigator.of(context).pushNamed(VisiMisiPage.tag);
                  //       },
                  //       child: Column(
                  //         children: <Widget>[
                  //           Icon(Icons.photo),
                  //           Text('Himpunan'),
                  //           Text('Mahasiswa'),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: SizedBox(
                      width: 110,
                      child: RaisedButton(
                        onPressed: () {},
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
                          Navigator.of(context).pushNamed(JadwalMatakuliahPage.tag);
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
                  )
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
                        onPressed: () {},
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
                        onPressed: () {},
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
