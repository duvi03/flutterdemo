import 'package:flutter/material.dart';

extension IntExtension on int{
  int validate({int value = 0}){
    return this ?? value;
  }

  Widget get kH => SizedBox(
    height:  toDouble(),
  );

  Widget get kW => SizedBox(
    width:  toDouble(),
  );
}