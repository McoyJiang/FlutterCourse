import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_tech/bean/HomPageBean.dart';

class JapaneseTvProvider {
  final String _endpoint = "http://taobao.jszks.net/index.php/Hanju/hanjufinal/type/0/p/1";
//  final String _endpoint = "https://randomuser.me/api/";
  final Dio _dio = Dio();

  Future<HomePageBeanResponse> getAllTv() async {
    try {
      Response response = await _dio.get(_endpoint);
      return HomePageBeanResponse.fromJson(json.decode(response.data));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return HomePageBeanResponse.withError("$error");
    }
  }
}