import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uhamka_mobile/dashboard_page.dart';
import 'package:barcode_scan/barcode_scan.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String result = 'test';

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        Navigator.pushReplacementNamed(context, DashboardPage.tag);
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = 'Camera permission was denied';
        });
      } else {
        setState(() {
          result = 'Unknown Error $ex';
        });
      }
    } on FormatException {
      setState(() {
        result = 'You pressed the back button before scanning anything';
      });
    } catch (ex) {
      result = 'Unknown Error $ex';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Colors.purple,
              image: new DecorationImage(
                image: new AssetImage("assets/teknik.png"),
                fit: BoxFit.fitWidth,
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
          // Navigator.pushReplacementNamed(context, DashboardPage.tag);
          _scanQR();
        },
        tooltip: 'Scan',
        child: Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
