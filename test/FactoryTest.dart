class Person{
  //要实现单例得缓存实例
  static Person? _cache;
  factory Person(){
    //为空则初始化
    return _cache??=Person._internal();
  }
  Person._internal();
}


main(){
 Person p1= Person();
 Person p2= Person();
 Person p3= Person();
 Person p4= Person();

 //证明是不是同一个对象
 assert(identical(p1, p2));
 assert(identical(p2, p3));
 assert(identical(p3, p4));
}