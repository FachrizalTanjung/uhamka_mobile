import 'package:http/http.dart' as http;
import 'package:uhamka_mobile/model/Dosen.dart';
import 'package:uhamka_mobile/services/CommonUtil.dart';

class DosenService {
  Future<List<Dosen>> getAllDataDosen() async {
    final response = await http.get(CommonUtil().baseUrl + '/dosen/get-all');
    if (response.statusCode == 200) {
      return fromJson(response.body);
    } else {
      return null;
    }
  }
}
