import 'package:flutter_tech/bean/MediaDetailsBean.dart';
import 'package:flutter_tech/data_source/RjDetailRepository.dart';
import 'package:rxdart/rxdart.dart';

class RjDetailBloc {
  final RjDetailRepository _japaneseTvRepository = RjDetailRepository();
  final BehaviorSubject<MediaDetailsResponse> _subject =
  BehaviorSubject<MediaDetailsResponse>();

  getRJDetails(String id) async {
    MediaDetailsResponse response = await _japaneseTvRepository.getRJDetails(id);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MediaDetailsResponse> get subject => _subject;
}
final RjDetailBloc rj_detail_bloc = RjDetailBloc();