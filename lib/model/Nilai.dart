import 'dart:convert' show json;

class Nilai {
  String nim;
  String idMatkul;
  String tugas;
  String kuis;
  String uts;
  String uas;

  Nilai({
    this.nim,
    this.idMatkul,
    this.tugas,
    this.kuis,
    this.uts,
    this.uas,
  });

  factory Nilai.fromJson(Map<String, dynamic> map) => Nilai(
        nim: map['nim'] as String,
        idMatkul: map['idMatkul'] as String,
        tugas: map['tugas'] as String,
        kuis: map['kuis'] as String,
        uts: map['uts'] as String,
        uas: map['uas'] as String,
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
