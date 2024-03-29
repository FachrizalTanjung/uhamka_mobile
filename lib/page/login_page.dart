import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uhamka_mobile/page/dashboard_dosen_page.dart';
import 'package:uhamka_mobile/page/dashboard_mahasiswa_page.dart';
import 'package:uhamka_mobile/services/LoginService.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String result = '';
  LoginService loginService;

  @override
  void initState() {
    super.initState();
    loginService = LoginService();
  }

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        var results = loginService.getLoginByID(qrResult);
        results.then((data) {
          if (data.type.contains('MHS')) {
            setState(() {
              // Navigator.pushReplacementNamed(
              //     context, DashboardMahasiswaPage.tag);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => DashboardMahasiswaPage(
                    login: data,
                  ),
                ),
              );
            });
          } else {
            setState(() {
              // Navigator.pushReplacementNamed(context, DashboardDosenPage.tag);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => DashboardDosenPage(
                    login: data,
                  ),
                ),
              );
            });
          }
        }, onError: (e) {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('Informasi'),
                    content: Text(
                        'Barcode yang anda masukkan salah, Silahkan masukkan barcode yang benar !'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Tutup'),
                        onPressed: () => Navigator.pop(context, 'Tutup'),
                      )
                    ],
                  ));
        });
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
              children: <Widget>[],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scanQR();
        },
        tooltip: 'Scan',
        child: Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
