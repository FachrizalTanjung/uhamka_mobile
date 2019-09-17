import 'dart:convert' show json;

class Mahasiswa {
  final String nim;
  final String nama;
  final String tempatTglLahir;
  final String alamat;
  final String angkatan;
  bool selected = false;

  Mahasiswa({
    this.nim,
    this.nama,
    this.tempatTglLahir,
    this.alamat,
    this.angkatan,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> map) => Mahasiswa(
      nim: map['nim'] as String,
      nama: map['nama'] as String,
      tempatTglLahir: map['tempatTglLahir'] as String,
      alamat: map['alamat'] as String,
      angkatan: map['angkatan'] as String);

  Map<String, dynamic> toJson() {
    return {
      'nim': nim,
      'nama': nama,
      'tempatTglLahir': tempatTglLahir,
      'alamat': alamat,
      'angkatan': angkatan,
    };
  }
}

List<Mahasiswa> fromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Mahasiswa>.from(data.map((item) => Mahasiswa.fromJson(item)));
}

String toJson(Mahasiswa mahasiswa) {
  final jsonData = mahasiswa.toJson();
  return json.encode(jsonData);
}
