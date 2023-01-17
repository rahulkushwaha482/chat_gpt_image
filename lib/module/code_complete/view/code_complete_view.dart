import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_gpt_image/module/code_complete/controller/code_complete_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/elevated_button.dart';

class CodeCompleteView extends GetView<CodeCompleteController> {
  const CodeCompleteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Complete Your Text'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blueAccent, //this has no effect
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Type something to complete the text",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Center(
                  child: ElevatedButtonText(
                    buttonText: 'Generate Text',
                    onPressed: controller.textComplete,
                    buttonHorizontalPadding: 0,
                    buttonPadding: 10,
                    inProgress: controller.inProgress.value,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() =>
                  // Text(controller.textCom.toString()),

                  (controller.textCom.isEmpty)
                      ? const SizedBox()
                      : AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              controller.textCom.toString(),
                              textStyle: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          totalRepeatCount: 1,
                        ))
            ],
          ),
        ),
      ),
    ));
  }
}
