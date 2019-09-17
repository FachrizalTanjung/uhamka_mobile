import 'package:http/http.dart' as http;
import 'package:uhamka_mobile/model/DataJadwal.dart';
import 'package:uhamka_mobile/services/CommonUtil.dart';

class JadwalService {
  Future<List<DataJadwal>> getAllDataJadwal() async {
    final response =
        await http.get(CommonUtil().baseUrl + '/mata-kuliah/get-all');
    if (response.statusCode == 200) {
      return fromJson(response.body);
    } else {
      return null;
    }
  }
}
