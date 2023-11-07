import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() => runApp(const GetMaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //依赖注入
    MyController ctrl= Get.put(MyController());
    return Scaffold(
      appBar: AppBar(title:const Text("全局状态控制"),),
      body: Center(child: Obx(()=>Text("${ctrl.index}",style:const TextStyle(fontSize: 30),)),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // ctrl.index++;
        ctrl.add();
      },child:const Icon(Icons.add),),
    );
  }
}

class MyController extends GetxController {
  var index = 0.obs;
  add()=>index++;

} 
