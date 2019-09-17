import 'dart:convert' show json;

class Login {
  String id;
  String nama;
  String type;

  Login({
    this.id,
    this.nama,
    this.type,
  });

  factory Login.fromJson(Map<String, dynamic> map) => Login(
        id: map['id'] as String,
        nama: map['nama'] as String,
        type: map['type'] as String,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'type': type,
    };
  }
}

Login fromJson(String jsonData) {
  final data = json.decode(jsonData);
  return Login.fromJson(data);
}

String toJson(Login login) {
  final jsonData = login.toJson();
  return json.encode(jsonData);
}
