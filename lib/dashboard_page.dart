import 'package:flutter/material.dart';
import 'package:uhamka_mobile/visi_misi_page.dart';

class DashboardPage extends StatelessWidget {
  static String tag = 'dashboard-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/bg-login.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: RaisedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushNamed(VisiMisiPage.tag);
                      },
                      icon: Icon(Icons.add_comment),
                      label: Text("Himpunan Mahasiswa"),
                    )),
                SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.book),
                      label: Text("Mata Kuliah"),
                    )),
                SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.exposure),
                      label: Text("Nilai Mahasiswa"),
                    )),
                SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.face),
                      label: Text("Data Dosen"),
                    )),
                SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.sentiment_very_satisfied),
                      label: Text("Profil Mahasiswa"),
                    )),
                SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.transit_enterexit),
                      label: Text("Logout"),
                    )),
                SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add_comment),
                      label: Text("Himpunan Mahasiswa"),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
