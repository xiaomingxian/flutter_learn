import 'package:flutter/material.dart';

import 'T9_font.dart';


void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('你好Flutter'),
      ),
      body: const Column(
        children: [MyApp(), FlutterButton(), MyButton(),
          // MyText(),
          // LocalImage(),
          // MyImage(), ClipImage()
        ],
      ),
    ),
  ));
}

class FlutterButton extends StatelessWidget {
  const FlutterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
        children: [
        Icon(Icons.dashboard,color: Colors.orange,),
        Icon(Icons.settings,color: Colors.grey,),
        Icon(Icons.verified_user_outlined,color: Colors.green,),
        Icon(Icons.voice_chat,color: Colors.green,),
        Icon(MyFonts.paiDui,color: Colors.green,),
        Icon(MyFonts.jaGou,color: Colors.green,),
        ],
    );
  }
}


class LocalImage extends StatelessWidget {
  const LocalImage

  ({super.key});

  @override
  Widget build(BuildContext context) {
    const localUrl = 'images/Icon-512.png';
    return Center(
      child: Image.asset(
        localUrl,
        width: 100,
        height: 100,
      ),
    );
  }
}

class ClipImage extends StatelessWidget {
  const ClipImage

  ({super.key});

  @override
  Widget build(BuildContext context) {
    String url =
        'https://edianzu-oss-work-order.oss-cn-beijing.aliyuncs.com/icon/writeForm.png';
    return Center(
      child: SizedBox(
          child: ClipOval(
              child: Image.network(
                url,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ))),
    );
  }
}

class MyImage extends StatelessWidget {
  const MyImage

  ({super.key});

  @override
  Widget build(BuildContext context) {
    String url =
        'https://edianzu-oss-work-order.oss-cn-beijing.aliyuncs.com/icon/writeForm.png';
    return Center(
      child: SizedBox(
        height: 200,
        width: 400,
        child: Image.network(url,
            color: Colors.white, colorBlendMode: BlendMode.modulate),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //位移
        // transform: Matrix4.translationValues(100, 10, 20),
        //旋转
        transform: Matrix4.rotationZ(0.2),
        alignment: Alignment.center,
        width: 200,
        height: 50,
        // color: Colors.blue,
        decoration: BoxDecoration(
            color: Colors.cyan, borderRadius: BorderRadius.circular(20.2)),
        child: const Text(
          "按钮按钮按钮按钮按钮按钮按钮按钮按钮按钮按钮按钮按钮按钮按钮按钮按钮按钮按钮",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

///自定义静态组件
class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  ///方式2 container --> dev
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(50, 0, 0, 30),
        height: 100,
        width: 400,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              //LinearGradient 线性渐变
                colors: [Colors.greenAccent, Colors.cyan]),
            borderRadius: BorderRadius.circular(30),
            //圆角
            color: Colors.cyan,
            // border: Border.all(color: Colors.green, width: 2),
            boxShadow: const [
              //阴影效果
              BoxShadow(color: Colors.grey, blurRadius: 20)
            ]),
        child: const Text(
          'Hello Word 这是我的自定义静态组件',
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
    );
  }

/// 方式1
// @override
// Widget build(BuildContext context) {
//   return const Center(
//     child: Text(
//       'Hello Word 这是我的自定义静态组件',
//       textDirection: TextDirection.ltr,
//       style: TextStyle(fontSize: 40, color: Colors.pink),
//     ),
//   );
// }
}

class MyText extends StatelessWidget {
  const MyText

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 100,
        color: Colors.lightGreen,
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: const Text(
          "我的文本",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
