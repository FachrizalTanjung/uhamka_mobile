import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uhamka_mobile/mixins/validation.dart';

class NilaiMahasiswaPage extends StatefulWidget {
  static String tag = 'nilai-mahasiswa';

  @override
  _NilaiMahasiswaPageState createState() => _NilaiMahasiswaPageState();
}

class _NilaiMahasiswaPageState extends State<NilaiMahasiswaPage>
    with Validation {
  static const menuItems = <String>['Dias', 'Raka', 'Rani'];
  static const matkulItems = <String>['animasi', 'ibadah'];

  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  final List<DropdownMenuItem<String>> _ddItems = matkulItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  final formKey = GlobalKey<FormState>();

  String nama = 'Dias';
  String matkul = 'animasi';
  int tugas = 0;
  int kuis = 0;
  int uts = 0;
  int uas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: const Text('Nilai Mahasiswa'),
          actions: <Widget>[],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  cbNama(),
                  cbMatkul(),
                  txtTugas(),
                  txtKuis(),
                  txtUts(),
                  txtUas(),
                  saveButton(),
                  cancelButton()
                ],
              ),
            ),
          ),
        ));
  }

  Widget cbNama() {
    return ListTile(
      trailing: DropdownButton<String>(
        value: nama,
        onChanged: (String value) {
          setState(() {
            nama = value;
          });
        },
        items: _dropDownMenuItems,
      ),
    );
  }

  Widget cbMatkul() {
    return ListTile(
      trailing: DropdownButton<String>(
        value: matkul,
        onChanged: (String value) {
          setState(() {
            matkul = value;
          });
        },
        items: _ddItems,
      ),
    );
  }

  Widget txtTugas() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Tugas',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        WhitelistingTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3)
      ],
    );
  }

  Widget txtKuis() {
    return TextFormField(
      autovalidate: true,
      decoration: InputDecoration(
        labelText: 'Kuis',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        WhitelistingTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3)
      ],
    );
  }

  Widget txtUts() {
    return TextFormField(
      autovalidate: true,
      decoration: InputDecoration(
        labelText: 'UTS',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        WhitelistingTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3)
      ],
    );
  }

  Widget txtUas() {
    return TextFormField(
      autovalidate: true,
      decoration: InputDecoration(
        labelText: 'UAS',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        WhitelistingTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3)
      ],
    );
  }

  Widget saveButton() {
    return RaisedButton(
      color: Colors.blueAccent,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('test');
          print(nama);
          print(matkul);
          print(tugas);
          print(kuis);
        }
      },
      child: Text('Simpan'),
    );
  }

  Widget cancelButton() {
    return RaisedButton(
      color: Colors.blueAccent,
      onPressed: () {},
      child: Text('Batal'),
    );
  }
}
