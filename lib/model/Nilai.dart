import 'dart:convert' show json;

class Nilai {
  int nim;
  String idMatkul;
  int tugas;
  int kuis;
  int uts;
  int uas;

  Nilai({
    this.nim,
    this.idMatkul,
    this.tugas,
    this.kuis,
    this.uts,
    this.uas,
  });

  factory Nilai.fromJson(Map<String, dynamic> map) => Nilai(
        nim: map['nim'] as int,
        idMatkul: map['idMatkul'] as String,
        tugas: map['tugas'] as int,
        kuis: map['kuis'] as int,
        uts: map['uts'] as int,
        uas: map['uas'] as int,
      );

  Map<String, dynamic> toJson() {
    return {
      'nim': nim,
      'idMatkul': idMatkul,
      'tugas': tugas,
      'kuis': kuis,
      'uts': uts,
      'uas': uas,
    };
  }
}

List<Nilai> fromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Nilai>.from(data.map((item) => Nilai.fromJson(item)));
}

String toJson(Nilai nilai) {
  final jsonData = nilai.toJson();
  return json.encode(jsonData);
}
