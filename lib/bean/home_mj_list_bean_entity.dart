class HomeMjListBeanEntity {
	String pagenow;
	List<HomeMjListBeanList> xList;

	HomeMjListBeanEntity({this.pagenow, this.xList});

	HomeMjListBeanEntity.fromJson(Map<String, dynamic> json) {
		pagenow = json['pagenow'];
		if (json['list'] != null) {
			xList = new List<HomeMjListBeanList>();(json['list'] as List).forEach((v) { xList.add(new HomeMjListBeanList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['pagenow'] = this.pagenow;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class HomeMjListBeanList {
	String zhuyan;
	String img;
	String zhuti;
	String otitle;
	String id;
	String daoyan;
	String m3u8;
	String playtime;
	String title;

	HomeMjListBeanList({this.zhuyan, this.img, this.zhuti, this.otitle, this.id, this.daoyan, this.m3u8, this.playtime, this.title});

	HomeMjListBeanList.fromJson(Map<String, dynamic> json) {
		zhuyan = json['zhuyan'];
		img = json['img'];
		zhuti = json['zhuti'];
		otitle = json['otitle'];
		id = json['id'];
		daoyan = json['daoyan'];
		m3u8 = json['m3u8'];
		playtime = json['playtime'];
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['zhuyan'] = this.zhuyan;
		data['img'] = this.img;
		data['zhuti'] = this.zhuti;
		data['otitle'] = this.otitle;
		data['id'] = this.id;
		data['daoyan'] = this.daoyan;
		data['m3u8'] = this.m3u8;
		data['playtime'] = this.playtime;
		data['title'] = this.title;
		return data;
	}
}
