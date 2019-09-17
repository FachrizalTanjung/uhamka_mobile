import 'dart:convert' show json;

class DataJadwal {
  final int idMatkul;
  final String jamNgajar;
  final String namaDosen;
  final String mataKuliah;
  final String ruanganNgajar;
  final String hari;
  bool selected = false;

  DataJadwal({
    this.idMatkul,
    this.jamNgajar,
    this.namaDosen,
    this.mataKuliah,
    this.ruanganNgajar,
    this.hari,
  });

  factory DataJadwal.fromJson(Map<String, dynamic> map) => DataJadwal(
        idMatkul: map['idMatkul'] as int,
        jamNgajar: map['jamNgajar'] as String,
        namaDosen: map['namaDosen'] as String,
        mataKuliah: map['mataKuliah'] as String,
        ruanganNgajar: map['ruanganNgajar'] as String,
        hari: map['hari'] as String,
      );

  Map<String, dynamic> toJson() {
    return {
      'idMatkul': idMatkul,
      'jamNgajar': jamNgajar,
      'namaDosen': namaDosen,
      'mataKuliah': mataKuliah,
      'ruanganNgajar': ruanganNgajar,
      'hari': hari,
    };
  }
}

List<DataJadwal> fromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<DataJadwal>.from(data.map((item) => DataJadwal.fromJson(item)));
}

String toJson(DataJadwal jadwal) {
  final jsonData = jadwal.toJson();
  return json.encode(jsonData);
}
