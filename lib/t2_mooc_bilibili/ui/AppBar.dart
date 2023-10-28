import 'package:flutter/material.dart';

appBar(String title,String rightTitle,VoidCallback rightButtonClick){
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: false,
    titleSpacing: 0,
    // leading:const BackButton(color: Colors.black,),
    leading:const BackButton(),
    // title: Text(title,style:const TextStyle(fontSize: 18,color: Colors.black),),
    title: Text(title,style:const TextStyle(fontSize: 18),),
    actions: [
      //InkWell可以实现点击时的水波纹效果。
      InkWell(onTap: rightButtonClick,child: Container(
        padding:const EdgeInsets.only(left: 15,right: 15),
        alignment: Alignment.center,
        child: Text(rightTitle,style: TextStyle(fontSize: 18,color: Colors.grey[500]),textAlign: TextAlign.center,),
      ),)
    ],
  );
}