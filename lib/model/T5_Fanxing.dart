

main() {
  print(getData(1));
  print(getData<String>("i am String type"));
  var myList = MyList<String>();
  //类型不对会报错
  myList.add('this is a ');
  var data = myList.getData(0);
  print(data);
}

T getData<T>(T value) {
  return value;
}


class MyList<T>{
  List list=<T>[];

  void add<T>(T data){
    list.add(data);
  }

  T getData( int index ){
    return list[index];
  }
}