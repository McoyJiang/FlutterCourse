class HomeListEntity {
  final String id;
  final String title;
  final String zhuti;
  final String img;

  HomeListEntity(this.id, this.title, this.zhuti, this.img);

  HomeListEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        zhuti = json['zhuti'],
        img = json['img'];

  Map<String, dynamic> toMap() {
    return {'tv_id': id, 'title': title, 'zhuti': zhuti, 'img': img};
  }
}

class HomePageBeanResponse {
  final List<HomeListEntity> entityList;
  final String errorMessage;

  HomePageBeanResponse(this.entityList, this.errorMessage);

  HomePageBeanResponse.fromJson(Map<String, dynamic> json)
      : entityList = (json["list"] as List)
            .map((i) => new HomeListEntity.fromJson(i))
            .toList(),
        errorMessage = '';

  HomePageBeanResponse.withError(String errorValue)
      : entityList = List(),
        errorMessage = errorValue;
}
