import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

///todo 试了下 安卓不可用 版本原因 待解决
main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String deviceInfo = '';
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('硬件信息'),
        ),
        body: Column(
          children: [
            const Divider(height: 40,),
            Center(
              child: Text(key: GlobalKey(), deviceInfo),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              getDeviceInfo();
            });
            print(deviceInfo);
          },
          child: Text("刷新"),
        ),
      ),
    );
  }

  Future<void> getDeviceInfo() async {
    if(Platform.isAndroid){
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"
    }
    if(Platform.isIOS){
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      print('Running on ${iosInfo.utsname.machine}');  // e.g. "iPod7,1"
      deviceInfo= iosInfo.toString();
    }

    if(Platform.isMacOS){
     MacOsDeviceInfo macOsDeviceInfo=await deviceInfoPlugin.macOsInfo;
     print('Running on ${macOsDeviceInfo.toString()}');  // e.g. "iPod7,1"
     deviceInfo= macOsDeviceInfo.toString();
    }

    //
    // WebBrowserInfo webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
    // print('Running on ${webBrowserInfo.userAgent}');
  }


}
