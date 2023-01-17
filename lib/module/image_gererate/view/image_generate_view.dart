import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_gpt_image/module/image_gererate/controller/image_generate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/elevated_button.dart';

class ImageGenerateView extends GetView<ImageGenerateController> {
 const  ImageGenerateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Generate Image using Chat GPT'),
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
                  hintText: "Type something to generate images",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Center(
                  child: ElevatedButtonText(
                    buttonText: 'Generate',
                    onPressed: controller.imageGeneration,
                    buttonHorizontalPadding: 0,
                    buttonPadding: 10,
                    inProgress: controller.inProgress.value,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => SizedBox(
                  height: 250,
                  child: (controller.image.isEmpty)
                      ? const SizedBox()
                      : CachedNetworkImage(
                          imageUrl: controller.image.toString(),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => const Center(
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator())),
                        ),
                ),
              ),
              Obx(
                () => IconButton(
                    onPressed: () {
                      controller.downloadImage(controller.image.value);
                    },
                    icon: (controller.image.isEmpty)
                        ? const SizedBox()
                        : const Icon(Icons.save_alt_outlined)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
