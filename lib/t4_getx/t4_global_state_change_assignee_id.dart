import 'package:flutter/material.dart';
import 'package:get/get.dart';

///指定id更新元素
main() => runApp(const GetMaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.put(MyController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("只对有某个属性的元素进行更新"),
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder<MyController>(
              id: "id",
              builder: (MyController controller) {
                return Text('${controller.index}');
              },
            ),
            GetBuilder<MyController>(
              id: "id2",
              builder: (MyController controller) {
                return Text('${controller.index}');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ctrl.add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyController extends GetxController {
  int index = 0;

  add() {
    index++;
    //只对有id属性的元素进行更新
    update(["id"]);
  }
}
