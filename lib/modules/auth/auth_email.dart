import 'dart:convert';
import 'package:assis_tech/config.dart';
import 'package:assis_tech/screens/Authcomponents/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:assis_tech/config.dart';
import 'dart:io';
import 'dart:async';
// import 'package:assis_tech//utils/network_util.dart';

import 'package:assis_tech/models/user.dart';

class AuthFactory {
  static final _loginURL = config.apiURL + "login";
  static final api = config.apiURL;
  Status _status = Status.Uninitialized;

  Future<User> authlogin(String email, String password, {debug: false}) {
    Map dados = {
      "email": email,
      "password": password,
    };
    _status = Status.Authenticating;
    return http.post(Uri.parse(_loginURL),
        body: jsonEncode(dados),
        headers: <String, String>{
          "content-type": "application/json; charset=UTF-8",

          // 'Authorization': "Bearer ${user.token}",
        }).then((dynamic res) {
      print(dados.toString());
      print(Uri.parse(_loginURL));
      if (res == null) throw new Exception("empty response");

      // if (res["error"] != null) throw new Exception(res["error_msg"]);
      var result = json.decode(res.body);
      print(result["id"]);
      // print("result ${result["access_token"]}");
      return User.map(json.decode(res.body));
      // return res;
    });
  }

  Future<Map> getdatafromid(id) {
    return http.get(Uri.parse(api + "user/" + id), headers: <String, String>{
      "content-type": "application/json; charset=UTF-8",
      'Authorization': "Bearer $token",
    }).then((dynamic res) {
      // if (res["error"] != null) throw new Exception(res["error_msg"]);
      Map result = json.decode(res.body);
      // print(result);
      // print("result ${result["access_token"]}");
      // print(result["id"]);
      return result;
      // return User.map(json.decode(res.body));
      // return res;
    });
  }

  Future<User> sobremim(token) {
    return http.get(Uri.parse(api + "me"), headers: <String, String>{
      "content-type": "application/json; charset=UTF-8",
      'Authorization': "Bearer $token",
    }).then((dynamic res) {
      // if (res["error"] != null) throw new Exception(res["error_msg"]);
      var result = json.decode(res.body);
      print(result);
      // print("result ${result["access_token"]}");
      return result;
      // return res;
    });
  }

  /// Request a new password for [email]

}
