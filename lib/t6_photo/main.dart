import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:native_exif/native_exif.dart';

///这个信息看起来是一张图片的EXIF元数据。我来解释下其中的一些主要信息:
///
/// LensMake: 摄像头的品牌,这里是尼康(NIKON)
/// DateTimeOriginal: 原始拍摄时间,这里是2022年6月22日 18:02:13
/// Flash: 是否使用闪光灯,0表示没有使用
/// MeteringMode: 测光模式,3代表点测光
/// FNumber: 镜头的光圈值,这里是F18
/// FocalLength: 镜头焦距,这里是49mm
/// ISOSpeedRatings: 感光度设置,这里是500
/// ExposureTime: 曝光时间,这里是0.003125秒
/// LensModel: 镜头型号,尼康 Z 24-70mm F4 S
/// ExposureProgram: 曝光程序,1代表手动模式
/// ExifVersion: Exif格式版本号
/// DateTimeDigitized: 数字化处理时间,这里和拍摄时间一致
/// 所以这是一张使用尼康Z 24-70mm镜头,焦距49mm,光圈F18,快门速度1/320秒,ISO 500,点测光的照片的exif信息。包含了拍摄时间、设备型号、曝光参数等图像的主要metadata。
main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhotoController ctrl = Get.put(PhotoController());

    return Scaffold(
      body: Center(
        child: GetBuilder<PhotoController>(
          builder: (PhotoController controller) {
            ImageProvider provider = FileImage(File(controller.imagePath));
            return getPhotoWidget(provider, context,controller);
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       ctrl.showMsg();
      //     },
      //     child: const Text("显示")
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.orange,
        onTap: (index){},
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.photo,),label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.person,),label: "我的"),
        ],
      ),
    );
  }
}

class PhotoController extends GetxController {
  String msg = '';
  String imagePath = "/Users/xxm/Desktop/0910/DSC_3447.png";
  Map<String,Object> photoMsg={};

  showMsg() async {
    // 获取照片的文件路径
    // String imagePath = "/Users/xxm/Desktop/0910/DSC_3447.png";
    Exif exif = await Exif.fromPath(imagePath);
    // final originalDate = await exif.getOriginalDate();
    // final latLong = await exif.getLatLong();
    // final attribute = await exif.getAttribute("key");
    final attributes = await exif.getAttributes();
    photoMsg=attributes!;
    await exif.close();
    msg = attributes.toString();
    update();
  }
}

Container getPhotoWidget(ImageProvider provider,BuildContext context,PhotoController controller) {
  return Container(
  alignment: Alignment.center,
  decoration: photoDecoration(),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      getPhoto(provider, context),
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 100,
        width: MediaQuery.of(context).size.width-100,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: getDesc(controller),
      ),
    ],
  ),
);

}

BoxDecoration photoDecoration() {
  return BoxDecoration();
}

Image getPhoto(ImageProvider<Object> provider, BuildContext context) {
  return Image(
      image: provider,
      width: MediaQuery.of(context).size.width-100,
      fit: BoxFit.contain,
    );
}

Padding getDesc(PhotoController controller) {
  return Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          direction: Axis.horizontal,//默认横轴
          runSpacing: 10,
          spacing: 10,
          alignment: WrapAlignment.start,
          children: [
            Text(controller.photoMsg['LensModel'].toString()),
            getNikonLogo(),
            Text(controller.photoMsg['DateTimeOriginal'].toString()),
            Text("F:${controller.photoMsg['FNumber'].toString()} | ${controller.photoMsg['FocalLength'].toString()}mm | ISO:${controller.photoMsg['ISOSpeedRatings'].toString()}"),
          ],
        ),
      );
}

Image getNikonLogo() {
  Image nikonImg= Image(
    image: FileImage(File("/Users/xxm/Desktop/nikon_icon.png")),
    width: 20,
    height: 20,
    fit: BoxFit.contain,
  );
  return nikonImg;
}