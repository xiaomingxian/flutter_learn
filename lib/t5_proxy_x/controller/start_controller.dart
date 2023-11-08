import 'package:flutter_learn/t5_proxy_x/vpn/vpn.dart';
import 'package:get/get.dart';

class StartController extends GetxController{
  bool start=false;
  bool loading=false;

  changeStatus(){
    start=!start;
    if(start){
      //开启vpn
      Vpn.startVpn("127.0.0.1", 7766);
    }else{
      //关闭vpn
      Vpn.stopVpn();
    }
    update();
  }
}