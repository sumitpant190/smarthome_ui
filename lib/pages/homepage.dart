import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          //custom app bar
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
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

            // welcome home
            Column(
              children: [
                Text('Welcome Home'),
                Text(
                  'Sumit Pant',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )

            //smart devices
          ],
        ),
      ),
    );
  }
}
