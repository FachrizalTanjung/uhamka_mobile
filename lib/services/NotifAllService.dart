import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:uhamka_mobile/model/NotifAllModel.dart';

class NotifAllService {
  static Future<NotifAllModel> notifAll(var body) async {
    final response = await http.post(Uri.encodeFull("http://haykampus.pontiversity.com/onesignal/create-notif-all.php"),
      headers: {"Accept": "application/json"},
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return NotifAllModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}