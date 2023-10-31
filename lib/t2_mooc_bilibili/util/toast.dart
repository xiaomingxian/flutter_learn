import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showSuccessToast(String msg){
  Fluttertoast.showToast(msg: msg,textColor: Colors.white,backgroundColor: Colors.lightGreen);
}