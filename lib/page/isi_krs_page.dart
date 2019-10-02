import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uhamka_mobile/model/Mahasiswa.dart';
import 'package:http/http.dart' as http;
import 'package:uhamka_mobile/model/Matkul.dart' as prefix0;
import 'package:uhamka_mobile/services/MahasiswaService.dart';
import 'package:uhamka_mobile/services/MatkulService.dart';

class Response {
  final String status;
  final String message;

  Response({this.status, this.message});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      status: json['status'],
      message: json['message'],
    );
  }
}

class IsiKrsPage extends StatefulWidget {
  static String tag = 'isi-krs-page';

  @override
  _IsiKrsPageState createState() => _IsiKrsPageState();
}

class _IsiKrsPageState extends State<IsiKrsPage> {
  List<Mahasiswa> _listMhs = List<Mahasiswa>();
  List<prefix0.Matkul> _listMk = List<prefix0.Matkul>();
  MahasiswaService mahasiswaService;
  MatkulService matkulService;
  String _nim;
  String _idMk;

  Future<Response> post(String url, var body) async {
    return await http.post(Uri.encodeFull(url),
        body: body,
        headers: {"Accept": "application/json"}).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return Response.fromJson(json.decode(response.body));
    });
  }

  @override
  void initState() {
    super.initState();
    mahasiswaService = MahasiswaService();
    mahasiswaService.getAllDataMhs().then((item) {
      setState(() {
        _listMhs = item;
      });
    });
    matkulService = MatkulService();
    matkulService.getAllDataMatkul().then((item) {
      setState(() {
        _listMk = item;
      });
    });
  }

  void _callAPI() {
    setState(() {
      http.post('http://baliimaginerentcar.com/uhamka-ws/krs/insert',
          body: {"nim": _nim, "idMatkul": _idMk});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: const Text('Isi KRS'),
        actions: <Widget>[],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: DropdownButton(
                  value: _nim,
                  onChanged: (newVal) {
                    setState(() {
                      _nim = newVal;
                    });
                  },
                  items: _listMhs.map((item) {
                    return new DropdownMenuItem(
                      child: Text(item.nama),
                      value: item.nim,
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: DropdownButton(
                  value: _idMk,
                  onChanged: (newVal) {
                    setState(() {
                      _idMk = newVal;
                    });
                  },
                  items: _listMk.map((item) {
                    return new DropdownMenuItem(
                      child: Text(item.namaMatkul),
                      value: item.idMatkul,
                    );
                  }).toList(),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                _callAPI();
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
            // getProperWidget(),
          ],
        ),
      ),
    );
  }
}
