import 'package:flutter/material.dart';
import 'package:mock_api_demo/app/app.dart';
import 'package:mock_api_demo/app/app_config.dart';
import 'package:mock_api_demo/app/core/network/api/api_constants.dart';

void main() async{
  AppConfig devAppConfig =
  AppConfig(
      appName: "Mock Api Demo",
      baseUrl: ApiConstant.baseUrlDebug
  );
  Widget app = await initializeApp(devAppConfig);
  runApp(app);
}
