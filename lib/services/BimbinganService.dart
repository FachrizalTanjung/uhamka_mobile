import 'package:http/http.dart' as http;
import 'package:uhamka_mobile/model/Bimbingan.dart';
import 'package:uhamka_mobile/services/CommonUtil.dart';

class BimbinganService {
  Future<List<Bimbingan>> getAllDataBimbingan() async {
    final response =
        await http.get(CommonUtil().baseUrl + '/bimbingan/get-all');
    if (response.statusCode == 200) {
      return fromJson(response.body);
    } else {
      return null;
    }
  }
}
