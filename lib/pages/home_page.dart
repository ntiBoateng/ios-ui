import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avatar_glow/avatar_glow.dart';

import '../utils/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double horizontalPadding = 30.0;
  double verticalPadding = 25;

  List myDevices = [
    ["Smart Light", "images/icons/light-bulb.png", true],
    ["Smart AC", "images/icons/air-conditioner_2.png", false],
    ["Smart TV", "images/icons/smart-tv.png", false],
    ["Smart Fan", "images/icons/fan.png", false],
  ];

  powerSwitchChanged(bool value, int index) {
    setState(() {
      myDevices[index][2] = value;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('images/icons/menu.png',
                            height: 45, color: Colors.grey[800]),
                        AvatarGlow(
                          glowColor: Colors.blue,
                          endRadius: 30.0,
                          duration: Duration(milliseconds: 2000),
                          repeat: true,
                          showTwoGlows: true,
                          repeatPauseDuration: Duration(milliseconds: 100),
                          child: Material(     // Replace this child with your own
                            elevation: 8.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(

                              child: Image.asset(
                                'images/icons/fan.png',
                                height: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Discoveries', style: GoogleFonts.arvo(fontSize: 17),),
                        Text("Bryce Willa", style: GoogleFonts.arvo(fontSize: 48)),
                      ],
                    )),

                const SizedBox(height: 20),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding),
                    child: Text('Smart Devices', style: GoogleFonts.arsenal(fontSize: 30),)),
                Expanded(
                    child: GridView.builder(
                        itemCount: myDevices.length,
                        padding:const EdgeInsets.all(28.0),
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                        itemBuilder: ((context, index) {
                          return SmartDeviceBox(
                              smartDeviceName: myDevices[index][0],
                              iconPath: myDevices[index][1],
                              powerOn: myDevices[index][2],
                              onChanged: (value) => powerSwitchChanged(value, index)
                          );
                        })))
              ],
            )));
  }
}
