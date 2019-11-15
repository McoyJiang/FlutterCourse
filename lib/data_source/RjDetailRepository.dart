import 'package:flutter_tech/bean/MediaDetailsBean.dart';
import 'package:flutter_tech/provider/RjDetailProvider.dart';

class RjDetailRepository {
  RjDetailProvider _provider = RjDetailProvider();

  Future<MediaDetailsResponse> getRJDetails(String id) {
    return _provider.getRjDetail(id);
  }
}