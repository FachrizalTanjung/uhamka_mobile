import 'dart:convert' show json;

class Matkul {
  String idMatkul;
  String namaMatkul;

  Matkul({
    this.idMatkul,
    this.namaMatkul,
  });

  factory Matkul.fromJson(Map<String, dynamic> map) => Matkul(
        idMatkul: map['idMatkul'] as String,
        namaMatkul: map['namaMatkul'] as String,
      );

  Map<String, dynamic> toJson() {
    return {
      'idMatkul': idMatkul,
      'namaMatkul': namaMatkul,
    };
  }
}

List<Matkul> fromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Matkul>.from(data.map((item) => Matkul.fromJson(item)));
}

String toJson(Matkul mk) {
  final jsonData = mk.toJson();
  return json.encode(jsonData);
}
