import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/data_source/MjTvRepository.dart';
import 'package:rxdart/rxdart.dart';

class AmericaTvBloc {
  final MjTvRepository _japaneseTvRepository = MjTvRepository();
  final BehaviorSubject<HomePageBeanResponse> _subject =
      BehaviorSubject<HomePageBeanResponse>();

  getAllTv() async {
    HomePageBeanResponse response = await _japaneseTvRepository.getAllMJ();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<HomePageBeanResponse> get subject => _subject;
}
final AmericaTvBloc mj_bloc = AmericaTvBloc();
