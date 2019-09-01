import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpCtrl {
  final Map<String, String> reqHeaders;

  HttpCtrl({this.reqHeaders = const {}});
  Future<_HttpResponse> getData({
    @required String url,
    Map param = const {},
  }) async {
    http.Response response = await HttpCtrl()._exec(url: url, param: param);
    return new _HttpResponse(
      body: response.body,
      statusCode: response.statusCode,
      headers: response.headers,
    );
  }

  Future<_HttpResponse> postData({
    @required String url,
    Map param = const {},
  }) async {
    http.Response response =
        await HttpCtrl()._exec(url: url, method: "post", param: param);
    return new _HttpResponse(
      body: response.body,
      statusCode: response.statusCode,
      headers: response.headers,
    );
  }

  Future _exec({
    @required String url,
    Map param = const {},
    String method = "get",
  }) async {
    http.Response response;
    if (method == "get") {
      String urlParam = "?";
      param.forEach((key, val) {
        urlParam += "$key=$val&";
      });
      url += urlParam;
      response = await http.get(Uri.encodeFull(url), headers: reqHeaders);
    } else if (method == "post") {
      response =
          await http.post(url, headers: reqHeaders, body: json.encode(param));
    }
    return response;
  }
}

class _HttpResponse {
  int statusCode;
  Map<String, String> headers;
  final body;

  _HttpResponse({
    this.statusCode,
    this.headers = const {},
    this.body,
  });

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "headers": headers,
        "body": body,
      };

  get getstatusCode => statusCode;
  get getheaders => headers;
  get getBody => json.decode(body);
}
