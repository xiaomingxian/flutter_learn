import 'package:flutter/material.dart';
import 'package:get/get.dart';

///GetBuilder + GetxController
main() => runApp(const GetMaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyController ctrl = Get.put(MyController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("全局状态2"),
      ),
      body: Center(
        child: GetBuilder<MyController>(
          builder: (MyController controller) {
            return Text(
              '${controller.index}',
              style: TextStyle(fontSize: 50),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ctrl.add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyController extends GetxController {
  int index = 0;

  add() {
    index++;
    update();
  }
}
