import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
final String smartDeviceName;
final String iconPath; 
final bool powerOn;
final void Function(bool)? onChanged;

  const SmartDeviceBox({super.key, required this.smartDeviceName, required this.iconPath, required this.powerOn, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(padding:const EdgeInsets.all(15.0),
    child: Container(
    decoration: BoxDecoration(color: powerOn ? Colors.teal: Colors.grey[200], borderRadius: BorderRadius.circular(21.0)),
    padding:const EdgeInsets.symmetric(vertical: 25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(iconPath, height: 65.0, color: powerOn ? Colors.yellow: Colors.black,),
          Row(
            children: [
             Expanded(child:  Padding(
               padding: const EdgeInsets.only(left: 12),
               child: Text(smartDeviceName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: powerOn ? Colors.orange : Colors.black),),
             )),
              Transform.rotate(angle: pi / 2,
              child: CupertinoSwitch(value: powerOn, onChanged: onChanged,)
              )],
          )
        ],
      ),
    
    )
    );
  }
}