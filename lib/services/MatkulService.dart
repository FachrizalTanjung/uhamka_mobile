import 'package:http/http.dart' as http;
import 'package:uhamka_mobile/model/Matkul.dart';
import 'package:uhamka_mobile/services/CommonUtil.dart';

class MatkulService {
  Future<List<Matkul>> getAllDataMatkul() async {
    final response = await http.get(CommonUtil().baseUrl + '/matkul/get-all');
    if (response.statusCode == 200) {
      return fromJson(response.body);
    } else {
      return null;
    }
  }
}
