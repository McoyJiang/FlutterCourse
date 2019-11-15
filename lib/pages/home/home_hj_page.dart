import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/bloc/HjTvBloc.dart';
import 'package:flutter_tech/pages/home/HomePageListItem.dart';

class home_hj_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageWidgetState();
  }
}

class _HomePageWidgetState extends State<home_hj_page> with AutomaticKeepAliveClientMixin {
  final List<HomeListEntity> _entityList = List();

  @override
  void initState() {
    super.initState();
    hj_bloc.getAllTv();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<HomePageBeanResponse>(
      stream: hj_bloc.subject.stream,
      builder: (context, AsyncSnapshot<HomePageBeanResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.errorMessage != null &&
              snapshot.data.errorMessage.length > 0) {
            return _buildErrorWidget(snapshot.data.errorMessage);
          }
          return _buildUserWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error occured: $error"),
          ],
        ));
  }

  Widget _buildUserWidget(HomePageBeanResponse data) {
    _entityList.clear();
    _entityList.addAll(data.entityList);
    return _gridView();
  }

  Widget _gridView() {
    return new GridView.count(
      crossAxisCount: 2,
      children: new List<Widget>.generate(_entityList.length, (index) {
        HomeListEntity _entry = _entityList[index];
        return HomePageListItem(_entry);
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
