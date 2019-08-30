import 'package:flutter/material.dart';

class VisiMisiPage extends StatelessWidget {
  static String tag = 'visi-misi-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visi & Misi'),
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/logo-hima-uhamka.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // new Center(
          //   child: Column(
          //     children: <Widget>[
          //       Text(
          //         "Visi",
          //         textAlign: TextAlign.center,
          //       )
          //     ],
          //   ),
          // ),
          new Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10.0),
            child: Text(
              "Visi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
            ),
          ),
        ],
      ),
    );
  }
}
