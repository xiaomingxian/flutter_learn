class User {
  late String name;
  late int age;

  ///_开头 且类是个单独的文件 是私有属性
  late String _email;

  User();

  // User(String name,int age);
  User.now() {
    print('匿名构造函数');
  }
  _run(){
    print('这是一个私有方法 只能在类里调用');
  }

  execRun(){
    //内部调用私有方法
    _run();
  }
}
