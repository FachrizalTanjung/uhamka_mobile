import 'package:http/http.dart' as http;
import 'package:uhamka_mobile/model/Mahasiswa.dart';
import 'package:uhamka_mobile/services/CommonUtil.dart';

class MahasiswaService {
  Future<List<Mahasiswa>> getAllMahasiswa() async {
    final response =
        await http.get(CommonUtil().baseUrl + '/mahasiswa/get-all');
    if (response.statusCode == 200) {
      return fromJson(response.body);
    } else {
      return null;
    }
  }
}
