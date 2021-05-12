import 'package:blog/generated/json/base/json_convert_content.dart';

class IndexEntity with JsonConvert<IndexEntity> {
	int? code;
	String? message;
	List<IndexData>? data;
}

class IndexData with JsonConvert<IndexData> {
	int? id;
	String? title;
	String? content;
	int? stytle;
	String? classifyId;
	String? classify;
	String? data;
	String? image;
}
