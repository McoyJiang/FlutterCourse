import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/provider/KoreaTvProvider.dart';

class HjTvRepository {
  KoreaTvProvider _tvProvider = KoreaTvProvider();

  Future<HomePageBeanResponse> getAllHJ() {
    return _tvProvider.getAllHJ();
  }
}