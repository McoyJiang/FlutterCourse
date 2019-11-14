import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/provider/JapaneseTvProvider.dart';

class RjTvRepository{
  JapaneseTvProvider _tvProvider = JapaneseTvProvider();

  Future<HomePageBeanResponse> getAllRJ() {
    return _tvProvider.getAllRJ();
  }
}