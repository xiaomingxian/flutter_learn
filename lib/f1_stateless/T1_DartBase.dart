void main() {
  var age = 1;
  var name = 'tom';
  var height = 172.2;
  String str = "my name is $name age is $age height is $height";

  var xx = 1.0;
  var res = xx * height;
  String duohangStr = '''
  第一行 
  第二行
  第三行
  ''';
  String yuanshiStr = r'aaa\n asas\t';

  print(str);
  print(res);
  print(duohangStr);
  print(yuanshiStr);
  print('检查字符串是否为空 ${yuanshiStr.isEmpty}');

  List listI = [1, 2, 3];
  listI.add('value');

  print(listI);

  //const是编译时常量 final是运行是常量（惰性初始化，运行时第一次才初始化）
  final finalVal;

  finalVal = DateTime.now();
  // const constVal=DateTime.now();
  //固定长度的集合 参数1长度 参数2每个元素的内容
  List list = List.filled(10, ["1", 2, 3]);
  print(list);
  //修改集合内数据
  list[1] = '修改内容1';
  list[2] = '修改内容2';
  print("修改后的集合:$list");
  //固定长度不可再添加内容
  // list.add('asasas');
  //指定类型时 只允许对应类型数据
  List<String>.filled(2, "1");
  List ll = <String>["1", '2'];
  print(ll);

  //map
  Map map1 = {"age": 1, "name": "tom"};
  var map2 = new Map();
  map2['name'] = 'lisa';
  map2["age"] = 22;
  print('map1:$map1');
  print('map2:$map2 ,获取name:${map2["name"]}');
  print('sasa' is String);
  print('map的key转换为list ${map2.keys.toList()}');
  //+ - * / ~/取整 %取余
  print('取整:${12 ~/ 5}');
  //++ --
  //b=a++ 先把a赋值给b 再a++,++a 先a++再复制给b
  var a = 10;
  var b = a++;
  print('a:$a,b:$b');
  var c = 10;
  var d = ++c;
  print('c:$c,d:$d');

  // while (a > 1) {
  //   print('while 循环:${a--}');
  // }
  // do {
  //   print('do while 循环:${c--}');
  // } while (c > 1);
  // list.forEach((element) {
  //   print('forEach $element');
  // });
  //修改集合内元素生成新元素 类似java8 stream().map().toList()
  List testList=["asa","2","q"];
  var list2 = testList.map((e) =>e + "修改元素").toList();
  print('list修改元素后:$list2');
  //where 类似于 java8 的 filter
  List testList2=[1,2,3,4,5,6,7,8,9];
  var list3 = testList2.where((element) => element>5).toList();
  print('where 过滤list后的结果:$list3');
  //any 有一个满足条件的
  var any = testList2.any((element) => element>5);
  print('any 过滤list后的结果:$any');
  //every
  var every = testList2.every((element) => element>5);
  print('every 过滤集合后的结果: $every');


}
