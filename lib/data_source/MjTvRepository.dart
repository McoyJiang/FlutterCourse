import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/provider/AmericaTvProvider.dart';

class MjTvRepository {
  AmericaTvProvider _tvProvider = AmericaTvProvider();

  Future<HomePageBeanResponse> getAllMJ() {
    return _tvProvider.getAllMJ();
  }
}