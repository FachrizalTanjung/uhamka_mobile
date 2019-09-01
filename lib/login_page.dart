import 'package:flutter/material.dart';
import 'package:uhamka_mobile/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/teknik.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Text(
                //   "Selamat Datang",
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                //   textAlign: TextAlign.center,
                // ),
                // Text(
                //   "di",
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                //   textAlign: TextAlign.center,
                // ),
                // Text(
                //   "UHAMKA MOBILE",
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, DashboardPage.tag);
        },
        tooltip: 'Scan',
        child: Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
