import 'dart:convert' show json;

class Dosen {
  final String nip;
  final String nama;
  final String alamat;
  final String noHp;
  bool selected = false;

  Dosen({
    this.nip,
    this.nama,
    this.alamat,
    this.noHp,
  });

  factory Dosen.fromJson(Map<String, dynamic> map) => Dosen(
      nip: map['nip'] as String,
      nama: map['nama'] as String,
      alamat: map['alamat'] as String,
      noHp: map['noHp'] as String);

  Map<String, dynamic> toJson() {
    return {
      'nip': nip,
      'nama': nama,
      'alamat': alamat,
      'noHp': noHp,
    };
  }
}

List<Dosen> fromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Dosen>.from(data.map((item) => Dosen.fromJson(item)));
}

String toJson(Dosen dosen) {
  final jsonData = dosen.toJson();
  return json.encode(jsonData);
}
