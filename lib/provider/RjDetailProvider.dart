import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tech/bean/MediaDetailsBean.dart';

class RjDetailProvider {
  final String _rjendpoint =
      "http://taobao.jszks.net/index.php/Hanju/xiangxifinal?iid=";
  final Dio _dio = Dio();

  Future<MediaDetailsResponse> getRjDetail(String id) async {
    try {
      Response response = await _dio.get('$_rjendpoint$id');
      return MediaDetailsResponse.fromJson(json.decode(response.data));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MediaDetailsResponse.withError("$error");
    }
  }
}