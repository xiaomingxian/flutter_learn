main() {
  /**
   * mixins 的类只能集成object,不能集成其他类
   * 作为mixins的类不能有构造函数
   * 一个类也可以mixins多个mixins类
   * mixins绝不是继承也不是接口 是一种全新的特性
   * 被混合类得加 mixin 修饰
   */
  var c = C("tom",20);
  print(c.name);
  print(c.age);
  c.infoA();
  c.infoB();
  //继承或者混合类有同名方法只会执行最后一个
  c.run();
}

mixin class A {
  String name = "my name is A";

  void infoA() {
    print('this is info A');
  }

  void run(){
    print('run A');
  }
}

mixin class BB {
  int age = 20;

  void infoB() {
    print('this is info B');
  }
  void run(){
    print('run B');
  }
}

class Person {
  late String name;
  late int age;

  Person(String name, int age) {
    this.name = name;
    this.age = age;
  }
  void run(){
    print('run Person');
  }
}

class C extends Person with A, BB {
  C(String name, int age) : super(name, age);
}
