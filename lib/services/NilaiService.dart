import 'package:http/http.dart' as http;
import 'package:uhamka_mobile/model/Nilai.dart';
import 'package:uhamka_mobile/services/CommonUtil.dart';

class NilaiService {
  Future<List<Nilai>> getAllDataNilai() async {
    final response = await http.get(CommonUtil().baseUrl + '/nilai/get-all');
    if (response.statusCode == 200) {
      return fromJson(response.body);
    } else {
      return null;
    }
  }
}
