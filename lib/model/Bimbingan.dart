import 'dart:convert' show json;

class Bimbingan {
  String nama;
  String nim;
  String judul;
  String pembimbing;
  String tanggal;
  String keterangan;
  bool selected = false;

  Bimbingan({
    this.nama,
    this.nim,
    this.judul,
    this.pembimbing,
    this.tanggal,
    this.keterangan,
  });

  factory Bimbingan.fromJson(Map<String, dynamic> map) => Bimbingan(
        nama: map['nama'] as String,
        nim: map['nim'] as String,
        judul: map['judul'] as String,
        pembimbing: map['pembimbing'] as String,
        tanggal: map['tanggal'] as String,
        keterangan: map['keterangan'] as String,
      );

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'nim': nim,
      'judul': judul,
      'pembimbing': pembimbing,
      'tanggal': tanggal,
      'keterangan': keterangan,
    };
  }
}

List<Bimbingan> fromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Bimbingan>.from(data.map((item) => Bimbingan.fromJson(item)));
}

String toJson(Bimbingan bs) {
  final jsonData = bs.toJson();
  return json.encode(jsonData);
}
