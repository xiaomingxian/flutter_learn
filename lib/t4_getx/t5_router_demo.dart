import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() => runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      getPages: _getRouterPage(),
    ));

List<GetPage> _getRouterPage() {
  List<GetPage> list = [
    //命名路由
    GetPage(name: '/page1', page: () => const Page1())
  ];
  return list;
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ParamController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("路由及传参demo"),
      ),
      body:const Center(child: Text("页面Demo..."),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo 跳转页面1 并带参数过去
          Get.toNamed("/page1", arguments: {"key": "value"});
        },
        child: const Text("跳转页面1"),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map params = Get.arguments;
    ParamController paramController = Get.find<ParamController>();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Page1页面 接受到的参数:${params.toString()}"),
            Divider(
              height: 30,
            ),
            GetBuilder<ParamController>(builder: (ParamController controller) {
             return Text("点击了${paramController.count}");
            },)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const Page2());
        },
        child: const Text("跳转页面2"),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ParamController paramController = Get.find<ParamController>();

    return Scaffold(
      body: Center(
        child: GetBuilder<ParamController>(builder: (ParamController controller) {
         return Text("点击的次数:${paramController.count}");
        },),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          paramController.addCount();
        },
        child: const Text("增加次数"),
      ),
    );
  }
}

///也可以通过Controller传递参数
class ParamController extends GetxController {
  String msg = '';
  int count = 0;

  addCount() {
    count++;
    update();
  }
}
