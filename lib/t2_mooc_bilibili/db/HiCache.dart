import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

///Flutter中的SharedPreferences允许保存简单的键值对数据。它类似于其他平台中的本地存储,可以在应用重启时保留数据。

class HiCache {
  static SharedPreferences? _sharedPreferences;

  HiCache._();

  static cacheData(String key, dynamic v) async {
    await _getSharedPreferences();
    print("赋值时的实例化信息:$_sharedPreferences");
    if (v is String) {
      _sharedPreferences!.setString(key, v);
    } else if (v is Bool) {
      _sharedPreferences!.setBool(key, (v as bool));
    } else {
      _sharedPreferences!.setString(key, v.toString());
    }
  }

  static _getSharedPreferences() async {
    print("实例化前的信息:$_sharedPreferences");
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print("---->>>>>获取实例时的实例信息:$_sharedPreferences");
  }

  static Object? get(String key) {
    _getSharedPreferences();
    print("获取值时：实例信息:$_sharedPreferences");
    var val = _sharedPreferences?.get(key);
    print("查询到的缓存结果:$val");
    return _sharedPreferences?.get(key);
  }
}

///SharedPreferences 为 flutter ui中的东西 只能在flutter环境中测 不能在dart中测
main() {}
