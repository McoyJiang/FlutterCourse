class HomeBeanItemEntity {
	String zhuyan;
	String jianjie;
	String title;
	List<HomeBeanItemList> xList;

	HomeBeanItemEntity({this.zhuyan, this.jianjie, this.title, this.xList});

	HomeBeanItemEntity.fromJson(Map<String, dynamic> json) {
		zhuyan = json['zhuyan'];
		jianjie = json['jianjie'];
		title = json['title'];
		if (json['list'] != null) {
			xList = new List<HomeBeanItemList>();(json['list'] as List).forEach((v) { xList.add(new HomeBeanItemList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['zhuyan'] = this.zhuyan;
		data['jianjie'] = this.jianjie;
		data['title'] = this.title;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class HomeBeanItemList {
	String zhuti;
	String weburl;
	String bofang;
	String playtime;
	String down;

	HomeBeanItemList({this.zhuti, this.weburl, this.bofang, this.playtime, this.down});

	HomeBeanItemList.fromJson(Map<String, dynamic> json) {
		zhuti = json['zhuti'];
		weburl = json['weburl'];
		bofang = json['bofang'];
		playtime = json['playtime'];
		down = json['down'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['zhuti'] = this.zhuti;
		data['weburl'] = this.weburl;
		data['bofang'] = this.bofang;
		data['playtime'] = this.playtime;
		data['down'] = this.down;
		return data;
	}
}
