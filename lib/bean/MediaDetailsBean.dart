class MediaDetailsResponse {
  String zhuyan;
  String jianjie;
  String title;
  List<MediaSeriesListItem> seriesList;
  String errorMessage;

  MediaDetailsResponse(
      {this.zhuyan, this.jianjie, this.title, this.seriesList});

  MediaDetailsResponse.fromJson(Map<String, dynamic> json)
      : seriesList = (json["list"] as List)
            .map((i) => new MediaSeriesListItem.fromJson(i))
            .toList(),
        zhuyan = json['zhuyan'],
        jianjie = json['jianjie'],
        title = json['title'],
        errorMessage = '';

  MediaDetailsResponse.withError(String errorValue)
      : seriesList = List(),
        errorMessage = errorValue;
}

class MediaSeriesListItem {
  String zhuti;
  String playtime;
  String downloadUrl;

  MediaSeriesListItem({this.zhuti, this.playtime, this.downloadUrl});

  MediaSeriesListItem.fromJson(Map<String, dynamic> json) {
    zhuti = json['zhuti'];
    playtime = json['playtime'];
    downloadUrl = json['down'];
  }
}
