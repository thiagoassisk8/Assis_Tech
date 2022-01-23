import 'dart:convert';
import 'package:assis_tech/config.dart';
import 'package:http/http.dart' as http;
import 'package:assis_tech/config.dart';
import 'dart:io';
import 'dart:async';
// import 'package:assis_tech//utils/network_util.dart';

import 'package:assis_tech/models/user.dart';

class AuthFactory {
  static final _loginURL = config.apiURL + "login";
  static final api = config.apiURL;
  static final _getUserURL = config.apiURL + "user/info";
  static final _facebookURL =
      config.siteURL + "app/auth/facebookkey?access_token=";
  static final _profileURL = config.apiURL + "user/profile";
  static final _requestNewPasswordURL = config.apiURL + "auth/request_password";
  static final _setPasswordURL = config.apiURL + "auth/reset_password";
  static final _requestPhoneURL = config.apiURL + "auth/phone";
  static final _validatePhoneURL = config.apiURL + "auth/validatePhone";

  Future<User> authlogin(String email, String password, {debug: false}) {
    Map dados = {
      "email": email,
      "password": password,
    };
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
      // print("result ${result["access_token"]}");
      return User.map(json.decode(res.body));
      // return res;
    });
  }

  Future<User> sobremim() {
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
