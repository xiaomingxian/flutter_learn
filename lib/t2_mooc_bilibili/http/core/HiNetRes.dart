import 'dart:convert';

class HiNetRes<T> {
  int code;
  String msg;
  T? data;

  HiNetRes({required this.code, required this.msg, this.data});

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return super.toString();
  }
}
