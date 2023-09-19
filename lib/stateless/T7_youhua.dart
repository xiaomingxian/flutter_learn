main() {
  ///const 编译时确定的值
  ///在Dart中,final和const关键字都可以用来定义一个编译时常量,但有以下几点区别:
  ///
  /// final变量只能被赋值一次,而const变量是隐式final的,也只能被赋值一次。
  /// final变量的值可以在运行时计算,而const变量的值必须是编译时常量。
  /// final变量可以不用立即初始化,可以先声明然后在后面才初始化,而const变量必须在声明时就立即初始化。
  /// const变量会在编译时生成一个编译时常量,而final变量的值会在运行时生成。
  /// const变量可以用在定义类的构造函数参数的默认值、集合字面量、类字段等地方。final变量不行。
  /// final和const都可以用来创建编译时常量,但是const会更好地优化和缓存。
  /// 所以简单来说:
  ///
  /// 如果变量的值在编译时已知,优先使用const。
  /// 如果变量的值需要在运行时计算,则必须使用final。
  /// 如果变量只需要设置一次值,两者都可以使用。
  /// const主要用来定义真正的编译时常量,final可以在运行时计算变量的值。

  final a = 1;
  const aa = 1;

  var x = identical(a, aa);
  print(x);

  print(identical([2], [2]));
  //const 修饰的常量 如果内存中已经有了则会沿用
  print(identical(const [2], const [2])); //true

  ///常量构造函数 常量构造函数赋值的参数必须加final
  ///实例化时不加 const 地址值是不一样的
  ///加const时一样
  var c1 = const Company(name: 'edy', address: 'bj');
  var c2 = const Company(name: 'edy', address: 'bj');
  print(identical(c1, c2));

  //值不同 地址值还是不同的
  var c11 = const Company(name: 'edy1', address: 'bj1');
  var c21 = const Company(name: 'edy', address: 'bj');
  print(identical(c11, c21));

  ///不加const 是不同的地址值
  var c3 = Company(name: 'edy', address: 'bj');
  var c4 = Company(name: 'edy', address: 'bj');
  print(identical(c3, c4));
}

///
class Company {
  final String name;
  final String address;
  final String email = '111';

  const Company({required this.name, required this.address});
}
