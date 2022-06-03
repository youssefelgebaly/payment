import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:ui';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  double initX = 0.0;
  double initY = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<GyroscopeEvent>(
              stream: SensorsPlatform.instance.gyroscopeEvents,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.y.abs() > 0.0) {
                    initX = initX + (snapshot.data!.y);
                  }
                  if (snapshot.data!.x.abs() > 0.0) {
                    initY = initY + (snapshot.data!.x);
                  }
                }
                return Positioned(
                  left: 10 - initX,
                  right: 10 + initX,
                  top: 10 - initY,
                  bottom: 10 + initY,
                  child: Center(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: 230,
                            height: 330,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  isAntiAlias: true,
                                  opacity: 0.8,
                                  image: NetworkImage('https://www.imagesource.com/wp-content/uploads/2019/06/Rio.jpg'),
                                  colorFilter: ColorFilter.mode(
                                      Colors.white.withOpacity(.1),
                                      BlendMode.srcOver),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.0)),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          right: 10,
                          top: 10,
                          bottom: 10,
                          child: Center(
                            child: Container(
                              width: 250,
                              height: 350,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: .1),
                                image: DecorationImage(
                                    image: NetworkImage('https://www.imagesource.com/wp-content/uploads/2019/06/Rio.jpg'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );

              }),

        ],
      ),
    );
  }
}
