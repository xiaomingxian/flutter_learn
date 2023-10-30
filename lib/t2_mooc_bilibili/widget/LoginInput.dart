import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/t2_mooc_bilibili/constants/color.dart';
import 'package:flutter_learn/t2_mooc_bilibili/util/LogUtil.dart';

class LoginInput extends StatefulWidget {
  final String title;
  final String hint;
  final ValueChanged<String> onChanged;
  final ValueChanged<bool> focusChanged;
  final bool lineStretch;
  final bool obscureText;
  final TextInputType keyBoardType;

  const LoginInput(
      {Key? key,
      required this.title,
      required this.hint,
      required this.onChanged,
      required this.focusChanged,
      this.lineStretch = false,
      this.obscureText = false,
      required this.keyBoardType})
      : super(key: key);

  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  //光标是否变化
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    //是否获取光标的监听
    _focusNode.addListener(() {
      LogUtil.printLog("是否获取到光标:${_focusNode.hasFocus}", StackTrace.current);
      //当光标变化时传递上去
      widget.focusChanged(_focusNode.hasFocus);
      //弹出键盘
      if(_focusNode.hasFocus){
        _focusNode.requestFocus();
      }

    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //行输入框：左右结构==column
    return Column(
      children: [
        Row(
          children: [
            _left(15,16),
            _right(),

          ],
        ),
        //!widget.lineStretch?15:0) 不展开向左缩进15
        Padding(padding: EdgeInsets.only(left: !widget.lineStretch?15:0),child:const Divider(
          height: 1,
          thickness: 0.5,
        ),)
      ],
    );
  }
  ///左侧标题
  Container _left(double marginLeft,double fontSize){
    return Container(
      padding: EdgeInsets.only(left: marginLeft),
      width: 100,
      child: Text(
        widget.title,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }

  Widget _right(){
    //Expanded自适应容器的宽高
    return Expanded(child: TextField(
      focusNode: _focusNode,
      onChanged: widget.onChanged,
      //密码
      obscureText: widget.obscureText,
      keyboardType: widget.keyBoardType,
      //不是密码时自动获取焦点
      autofocus: !widget.obscureText,
      //自定义颜色常量
      cursorColor: primary,
      style:const TextStyle(
        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w300
      ),
      decoration: InputDecoration(
        contentPadding:const EdgeInsets.only(left: 20,right: 20),
        //无边框
        border: InputBorder.none,
        //widget.hint??'' 不为空就使用它自己的值 否则就为''
        hintText: widget.hint??'',
        hintStyle:const TextStyle(fontSize: 15,color: Colors.grey)
      ),
    ));
  }
}

