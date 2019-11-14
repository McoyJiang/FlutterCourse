import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_tech/bean/HomPageBean.dart';

class JapaneseTvProvider {
  final String _rjendpoint = "http://taobao.jszks.net/index.php/Hanju/hanjufinal/type/0/p/1";
  final Dio _dio = Dio();

  Future<HomePageBeanResponse> getAllRJ() async {
    try {
      Response response = await _dio.get(_rjendpoint);
      return HomePageBeanResponse.fromJson(json.decode(response.data));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return HomePageBeanResponse.withError("$error");
    }
  }
}