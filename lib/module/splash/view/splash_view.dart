import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController>{

  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return   SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding:  EdgeInsets.all(40.0),
            child:  Image.asset(
              'assets/openapi.jpeg',
              scale: 3,
            ),
          ),
        ),
      ),
    );
  }

}