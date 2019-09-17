import 'dart:convert' show json;

class KegiatanMahasiswa {
  final String jenis;
  final String desc;
  final String type;

  KegiatanMahasiswa({
    this.jenis,
    this.desc,
    this.type,
  });

  factory KegiatanMahasiswa.fromJson(Map<String, dynamic> map) =>
      KegiatanMahasiswa(
        jenis: map['jenis'] as String,
        desc: map['desc'] as String,
        type: map['type'] as String,
      );

  Map<String, dynamic> toJson() {
    return {
      'jenis': jenis,
      'desc': desc,
      'type': type,
    };
  }
}

List<KegiatanMahasiswa> fromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<KegiatanMahasiswa>.from(
      data.map((item) => KegiatanMahasiswa.fromJson(item)));
}

String toJson(KegiatanMahasiswa kgtn) {
  final jsonData = kgtn.toJson();
  return json.encode(jsonData);
}
