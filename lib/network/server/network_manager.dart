import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasictemplate/constant/api_constant.dart';
import 'package:flutterbasictemplate/model/application/application_setting.dart';

import 'network_helper.dart';

_NetworkManager networkManager = _NetworkManager._();

class _NetworkManager with NetworkHelper {
  _NetworkManager._();

  Future<ApplicationSetting?> fetchApplicationData(
      {ValueSetter<DioError>? errorResponse}) async {
    final doc = await get(ApplicationSetting(), NetworkApi.APPLICATION_DATA,
        errorListener: (error) {
      errorResponse!(error);
    });
    return doc;
  }
}
