import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:itunesapp/home/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 10),
      () => Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return const HomeScreen();
      }))),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = Get.width;
    final h = Get.height;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: w,
          height: h,
          child: Stack(children: [
            FadeInDown(
              delay: const Duration(milliseconds: 100),
              child: Container(
                width: w,
                height: h / 2,
                decoration: const BoxDecoration(
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(1000),
                        bottomLeft: Radius.circular(1000))),
              ),
            ),
            Positioned(
              top: 90,
              left: 60,
              child: FadeInDown(
                delay: const Duration(milliseconds: 800),
                child: SizedBox(
                  width: w / 1.5,
                  height: h / 10,
                  child: const Center(
                    child: Text(
                      "Music Store",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 130,
              left: 60,
              child: FadeInDown(
                delay: const Duration(milliseconds: 1200),
                child: SizedBox(
                  width: w / 1.5,
                  height: h / 10,
                  child: const Center(
                    child: Text(
                      "Itunes App",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 220,
              left: 75,
              child: FadeInDown(
                delay: const Duration(milliseconds: 3000),
                child: Spin(
                  delay: const Duration(milliseconds: 6000),
                  child: SizedBox(
                    width: w / 1.2,
                    height: h / 3.0,
                    child: Center(
                        child: Image.asset(
                            'assets/images/Instagram Video Streaming-pana.png')),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
