import 'package:flutter/material.dart';
import 'package:flutter_tech/bean/HomPageBean.dart';
import 'package:flutter_tech/bean/MediaDetailsBean.dart';
import 'package:flutter_tech/bloc/RjDetailBloc.dart';
import 'package:flutter_tech/widgets/Demo.dart';

class RjDetailPage extends StatefulWidget {
  final HomeListEntity _entity;

  RjDetailPage(this._entity);

  @override
  State<StatefulWidget> createState() {
    return _RjDetailPageState();
  }
}

class _RjDetailPageState extends State<RjDetailPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    rj_detail_bloc.getRJDetails(widget._entity.id);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<MediaDetailsResponse>(
      stream: rj_detail_bloc.subject.stream,
      builder: (context, AsyncSnapshot<MediaDetailsResponse> snapshot) {
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

  Widget _buildUserWidget(MediaDetailsResponse data) {
    return Material(
      color: Colors.white,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
