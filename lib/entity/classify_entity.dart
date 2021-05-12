import 'package:blog/generated/json/base/json_convert_content.dart';
import 'package:blog/generated/json/base/json_field.dart';

class ClassifyEntity with JsonConvert<ClassifyEntity> {
	int? code;
	String? message;
	List<ClassifyData>? data;
}

class ClassifyData with JsonConvert<ClassifyData> {
	String? date;
	@JSONField(name: "list")
	List<ClassifyDataList>? xList;
}

class ClassifyDataList with JsonConvert<ClassifyDataList> {
	int? id;
	String? title;
	String? content;
	int? stytle;
	int? classifyId;
	String? classify;
	String? data;
	String? image;
}
