import 'package:flutter/foundation.dart';

/// Custom app configuration file
/// Pro tip: Save everything that is common for all application here
var siteURL = "";
var baseURL = "";
var token = "";
//O original é o localhost
var localSiteURL = "http://127.0.0.1:8000/";
var localBaseURL = "http://127.0.0.1:8000/";
// var localSiteURL = "http://sistema.gestaoutil.com.br:8082/";
// var localBaseURL = "http://sistema.gestaoutil.com.br:8082/";

var apiURL = baseURL + "api/";
var localApiURL = localBaseURL + "api/";

var config = Config(
    (kReleaseMode == true) ? siteURL : localSiteURL,
    (kReleaseMode == true) ? baseURL : localBaseURL,
    (kReleaseMode == true) ? apiURL : localApiURL);

class Config {
  final String siteURL;
  final String baseURL;
  final String apiURL;

  const Config(this.siteURL, this.baseURL, this.apiURL);
}
