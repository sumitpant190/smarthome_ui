import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smarthome_ui/utils/smartdevicebox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //padding
  final double horizontalPadding = 35;
  final double verticalPadding = 20;

  //list of smart devices
  List mySmartDevices = [
    //[device name , iconPath, status]
    ['Smart Light', 'lib/icons/light-bulb.png', true],
    ['Smart Ac', 'lib/icons/air-conditioner.png', false],
    ['Smart TV', 'lib/icons/smart-tv.png', false],
    ['Smart Fan', 'lib/icons/fan.png', false],
  ];

  //power switch button
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //custom app bar
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                  )
                ],
              ),
            ),
            SizedBox(height: 20),

            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Home'),
                  Text(
                    'Sumit Pant',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),

            //smart devices grid

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Text(
                'Smart Devices',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: mySmartDevices.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2],
                        onChanged: (value) => powerSwitchChanged(value, index),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
