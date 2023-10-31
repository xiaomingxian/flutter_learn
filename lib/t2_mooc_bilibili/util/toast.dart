import 'package:fluttertoast/fluttertoast.dart';

showSuccessToast(String msg){
  Fluttertoast.showToast(msg: msg,gravity: ToastGravity.CENTER);
  // Fluttertoast.showToast(msg: msg,textColor: Colors.white,backgroundColor: Colors.lightGreen,gravity: ToastGravity.CENTER);
}