import 'package:http/http.dart' as http;
import 'package:uhamka_mobile/model/KegiatanMahasiswa.dart';
import 'package:uhamka_mobile/services/CommonUtil.dart';

class KegiatanMahasiswaService {
  Future<List<KegiatanMahasiswa>> getAllKegiatanMhs() async {
    final response =
        await http.get(CommonUtil().baseUrl + '/kegiatan-mahasiswa/get-all');
    if (response.statusCode == 200) {
      return fromJson(response.body);
    } else {
      return null;
    }
  }
}
