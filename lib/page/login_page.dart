import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:uhamka_mobile/page/dashboard_dosen_page.dart';
import 'package:uhamka_mobile/page/dashboard_mahasiswa_page.dart';
import 'package:uhamka_mobile/services/LoginService.dart';
import 'package:uhamka_mobile/services/NotifAllService.dart';

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
    initPlatformState();
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
              children: <Widget>[
                RaisedButton(
                  child: Text("Coba Push Notif"),
                  onPressed: (){

                    var params = new Map<String, dynamic>();
                    params["title"] = "Notifikasi Mahasiswa";
                    params["subtitle"] = "Terdapat data nilai baru";

                    NotifAllService.notifAll(params).then((response) async {
                      print(response.status.toString());
                    }, onError: (error) {
                      print(error.toString());
                    });

                  },
                )
              ],
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

  Future<void> initPlatformState() async {
    await OneSignal.shared.init(
        "016cabf8-ff7f-42e1-bbb3-e28d10565469",
        iOSSettings: {
          OSiOSSettings.autoPrompt: false,
          OSiOSSettings.inAppLaunchUrl: true
        }
    );
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);


//    //Hendle Notification when opened
//    OneSignal.shared.setNotificationOpenedHandler((notification) {
//      var notify = notification.notification.payload.additionalData;
//
//      if (notify["type"] == "form 1") {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => Form1(text: notify["type"],),
//          ),
//        );
//      }
//      if (notify["type"] == "form 2") {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => Form2(text: notify["type"],),
//          ),
//        );
//      }
//      if (notify["type"] == "form 3") {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => Form3(text: notify["type"],),
//          ),
//        );
//      }
////      print('Opened');
//    });
  }
}
