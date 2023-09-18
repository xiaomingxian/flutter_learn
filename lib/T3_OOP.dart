import 'package:flutter_learn/model/User.dart';

void main() {
  var user = new User();
  user.execRun();
  var son = new Son("tom", 22, "男");
  son.printSonInfo();
}

class Son extends Parent {
  late String sex;

  Son(String name, num age, String sex) : super(name, age) {
    this.sex = sex;
  }

  void printSonInfo() {
    print('name:$name,age:$age,sex:$sex');
  }
}

class Parent {
  late String name;
  late num age;

  Parent(String name, num age) {
    this.name = name;
    this.age = age;
  }
}


abstract class AClass{
  eat();
  run();
  play();
}
class SAclass implements AClass{
  @override
  eat() {
    // TODO: implement eat
    throw UnimplementedError();
  }

  @override
  play() {
    // TODO: implement play
    throw UnimplementedError();
  }

  @override
  run() {
    // TODO: implement run
    throw UnimplementedError();
  }

}
 class SBclass extends AClass {
  @override
  eat() {
    // TODO: implement eat
    throw UnimplementedError();
  }

  @override
  play() {
    // TODO: implement play
    throw UnimplementedError();
  }

  @override
  run() {
    // TODO: implement run
    throw UnimplementedError();
  }
}