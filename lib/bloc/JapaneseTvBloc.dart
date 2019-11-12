import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/data_source/JapaneseTvRepository.dart';
import 'package:rxdart/rxdart.dart';

class JapaneseTvBloc {
  final JapaneseTvRepository _japaneseTvRepository = JapaneseTvRepository();
  final BehaviorSubject<HomePageBeanResponse> _subject =
      BehaviorSubject<HomePageBeanResponse>();

  getAllTv() async {
    HomePageBeanResponse response = await _japaneseTvRepository.getAllTv();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<HomePageBeanResponse> get subject => _subject;
}
final JapaneseTvBloc bloc = JapaneseTvBloc();
