import 'package:flutter/material.dart';
import 'package:flutter_learn/t5_proxy_x/controller/start_controller.dart';
import 'package:get/get.dart';

main() => runApp(const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => StartController());
    return Scaffold(
      floatingActionButton: GetBuilder<StartController>(
        builder: (StartController startCtrl) {
          return FloatingActionButton(
              backgroundColor:
                  startCtrl.start ? Colors.orange : Colors.lightBlueAccent,
              onPressed: () {
                startCtrl.changeStatus();
              },
              child:InkWell(child: Text(startCtrl.start ? "停止" : "开始"),)
          );
        },
      ),
    );
  }
}
