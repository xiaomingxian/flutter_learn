main() {
  //
  void fun2() {
    print('my function2 定义在main方法内');
  }

  void fun3() {
    void fun3_1() {
      print('my func3-1 定义在方法fun3内的方法 ，通fun3调用，外部无法调用');
      fun2();
      fun1();
      print('fun3_1 可以调用外部方法 外部的作用域大');
    }

    fun3_1();
  }

  fun1();
  fun2();
  fun3();
  keXuanCanShu("tom");
  keXuanCanShu("alice", 22);
  mingMingCanShu(name: 'tom', age: 19);

  funParams(() {
    print('这是个匿名参数');
  });
  var fn = () => funMyOut();
  funParams(fn);
  (() => print('自执行方法'))();
  (() {
    print('自自行方法2');
  })();
  ((num) {
    print('自执行方法 带参数 $num');
  })(12);
  /*
   * 闭包
   * 全局变量：常驻内存 全局变量污染全局
   * 局部变量：不会常驻内存 会被垃圾机制回收 不会污染全局
   * 想实现的功能
   * 1.常驻内存，2.不污染全局
   * 闭包：函数嵌套函数 内部函数会调用外部函数的变量或参数 变量或参数不会被系统
   * 闭包的写法：函数嵌套函数 并return 里面的函数 这样就形成了闭包
   *
   *
   *
   * 闭包的主要意义有:
      1. 封装和隐藏实现细节
      闭包可以在内部封装变量和实现细节,只向外暴露一个简单的函数接口。外部代码不需要关心也无法访问闭包内部的实现逻辑,提高了模块间的隔离性。
      2. 缓存外部变量的值
      闭包函数可以缓存外部作用域的变量值,即使当外部作用域不存在后,闭包内的变量值也不会消失,可以继续使用。
      3. 延迟执行  ************ 当调用方 拿到结果使用时才真正调用 ***********
      可以使用闭包延迟执行代码段,直到需要的时候再通过闭包调用。这样可以控制代码的执行时机。
      4. 改变函数内部状态
      闭包允许通过参数捕获外部状态,并在内部保存状态。这样可以避免使用全局变量或实例变量来维护状态。
      5. 回调函数
      将闭包作为参数传递给其他函数,这样的闭包称为回调函数。回调函数允许在未来的某个时刻执行代码段。
      6. 函数柯里化
      通过闭包实现柯里化(Currying),将一个多参数函数转换为单参数的形式,每次只传一个参数。
      所以综上,闭包是功能强大的函数对象,可以帮助我们封装逻辑、控制代码执行、维护状态等,是Flutter函数式编程的重要组成部分。
   **/
  funBiBao(){
    var a=123;
    return (){
      a++;
      print("执行方法 此处的a是个全局变量 $a");
    };
  }

  var biBaoRes = funBiBao();
  print('闭包方法还未执行');
  biBaoRes();
  biBaoRes();
  biBaoRes();


}

//
void fun1() {
  print('my function1 定义在main方法外');
}

funMyOut() {
  print('this is funMyOut');
}

funParams(fun) {
  fun();
}

void mingMingCanShu({required String name, int? age}) {
  print('name:$name,age:$age');
}


/// 可选参数 默认参数
///
void keXuanCanShu(String name, [int? age, String sex = '男']) {
  if (age == null) {
    print('name:$name,sex:$sex');
  } else {
    print('name:$name,age:$age,sex:$sex');
  }
}
