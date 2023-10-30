import 'package:flutter/material.dart';
import 'package:flutter_learn/t2_mooc_bilibili/constants/color.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final bool enable;
  final VoidCallback? onPressed;
  const LoginButton(this.title,{Key? key,this.enable=false,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FractionallySizedBox(
      //1 沾满整个宽度
      widthFactor: 1,
      child: MaterialButton(onPressed: () {},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6)),
          height: 45,
          onLongPress: enable?onPressed:null,
          disabledColor: primary[50],
          color: primary,
          child:Text(title,style: TextStyle(color: Colors.white,fontSize: 16),)),
    );;
  }
}

