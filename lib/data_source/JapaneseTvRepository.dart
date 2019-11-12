import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/provider/JapaneseTvProvider.dart';

class JapaneseTvRepository {
  JapaneseTvProvider _japaneseTvProvider = JapaneseTvProvider();

  Future<HomePageBeanResponse> getAllTv() {
    return _japaneseTvProvider.getAllTv();
  }
}