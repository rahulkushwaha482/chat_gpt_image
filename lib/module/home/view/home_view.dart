import 'package:chat_gpt_image/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/openapi.jpeg',
            scale: 3,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButtonText(
            buttonText: 'Text complete using Chat GPT',
            onPressed: controller.codeComplete,
            inProgress: false,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButtonText(
            buttonText: 'Generate Image using Chat GPT',
            onPressed: controller.imageGenerate,
            inProgress: false,
          ),
        ],
      ),
    )));
  }
}
