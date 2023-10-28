import 'package:flutter/material.dart';

class LoginEffect extends StatefulWidget {
  final bool protect;

  const LoginEffect({Key? key, this.protect = false}) : super(key: key);

  @override
  _LoginEffectState createState() => _LoginEffectState();
}

class _LoginEffectState extends State<LoginEffect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _img(true),
          Image(height: 90,width: 90,image: AssetImage('images/logo.png'),),
          _img(false),
        ],
      ),
    );
  }

  _img(bool left) {
    var leftImg = widget.protect
        ? "images/head_left_protect.png"
        : "images/head_left.png";
    var rightImg = widget.protect
        ? "images/head_right_protect.png"
        : "images/head_right.png";
    return Image(
      height: 90,
      image: AssetImage(left ? leftImg : rightImg),
    );
  }
}
