import 'package:blog/entity/index_entity.dart';

indexEntityFromJson(IndexEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['message'] != null) {
		data.message = json['message'].toString();
	}
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => IndexData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> indexEntityToJson(IndexEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}

indexDataFromJson(IndexData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['stytle'] != null) {
		data.stytle = json['stytle'] is String
				? int.tryParse(json['stytle'])
				: json['stytle'].toInt();
	}
	if (json['classifyId'] != null) {
		data.classifyId = json['classifyId'].toString();
	}
	if (json['classify'] != null) {
		data.classify = json['classify'].toString();
	}
	if (json['data'] != null) {
		data.data = json['data'].toString();
	}
	if (json['image'] != null) {
		data.image = json['image'].toString();
	}
	return data;
}

Map<String, dynamic> indexDataToJson(IndexData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['content'] = entity.content;
	data['stytle'] = entity.stytle;
	data['classifyId'] = entity.classifyId;
	data['classify'] = entity.classify;
	data['data'] = entity.data;
	data['image'] = entity.image;
	return data;
}