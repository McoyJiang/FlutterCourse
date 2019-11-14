import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_tech/bean/HomPageBean.dart';

class AmericaTvProvider{
  final String _mjendpoint =
      "http://rrys.luomeidi.com/Meiju/newmeiju/type/0/p/1";
  final Dio _dio = Dio();

  Future<HomePageBeanResponse> getAllMJ() async {
    try {
      Response response = await _dio.get(_mjendpoint);
      return HomePageBeanResponse.fromJson(json.decode(response.data));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return HomePageBeanResponse.withError("$error");
    }
  }
}
