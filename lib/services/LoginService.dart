import 'package:http/http.dart' as http;
import 'package:uhamka_mobile/model/Login.dart';
import 'package:uhamka_mobile/services/CommonUtil.dart';

class LoginService {
  Future<Login> getLoginByID(String id) async {
    final response = await http.get(CommonUtil().baseUrl + '/login?id=$id');
    if (response.statusCode == 200) {
      return fromJson(response.body);
    } else {
      return null;
    }
  }
}
