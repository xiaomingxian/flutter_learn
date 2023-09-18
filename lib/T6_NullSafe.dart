main() {
  ///以下类型报错
  // var a=11;
  // a=null;

  ///?->可空类型
  int? a = 1;
  a = null;

  ///可空类型
  String? fun1() {
    return null;
  }
}
