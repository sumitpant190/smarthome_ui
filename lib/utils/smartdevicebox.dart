import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: powerOn ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //icon
              Image.asset(
                iconPath,
                height: 60,
                color: powerOn ? Colors.white : Colors.black,
              ),

              //device name + switch
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      smartDeviceName,
                      style: TextStyle(
                          color: powerOn ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  )),
                  Transform.rotate(
                      angle: pi / 2,
                      child:
                          CupertinoSwitch(value: powerOn, onChanged: onChanged))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
