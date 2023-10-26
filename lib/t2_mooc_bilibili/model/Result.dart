//
// //表示 Result 是 result.g.dart 的一部分
// import 'package:json_annotation/json_annotation.dart';
//
// part 'result.g.dart';
//
// @JsonSerializable()
// class Result {
//   int code;
//   String method;
//   String requestParams;
//
//   Result(this.code, this.method, this.requestParams);
//
//   //固定格式
//   factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
//   //有返回值，无返回值的这样写:_ResultFromJson(this);
//   Map<String, dynamic> toJson() => _$ResultFromJson(this);
// }

//todo 为什么编译不过
