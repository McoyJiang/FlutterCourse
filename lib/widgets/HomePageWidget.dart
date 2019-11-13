import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/bloc/JapaneseTvBloc.dart';
import 'package:flutter_tech/widgets/HomePageListItem.dart';
import 'package:flutter_tech/widgets/ItemList.dart';

class HomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageWidgetState();
  }
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final List<HomeListEntity> _entityList = List();

  @override
  void initState() {
    super.initState();
    bloc.getAllTv();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomePageBeanResponse>(
      stream: bloc.subject.stream,
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
      children: [Text("Loading data from API..."), CircularProgressIndicator()],
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
//    return ListView.builder(
//      itemCount: _entityList.length,
//      scrollDirection: Axis.vertical,
//      physics: ClampingScrollPhysics(),
//      itemBuilder: buildList,
//    );
  }

  Widget buildList(BuildContext context, int index) {
    HomeListEntity entry = _entityList[index];
    return HomePageListItem(entry);
  }

  Widget _gridView() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(4.0),
      childAspectRatio: 8.0 / 9.0,
      children: _entityList
          .map(
            (Item) => ItemList(item: Item),
      )
          .toList(),
    );
  }
}
