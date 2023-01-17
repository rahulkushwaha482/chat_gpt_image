
import 'package:chat_gpt_image/module/image_gererate/controller/image_generate_controller.dart';
import 'package:get/get.dart';

class ImageGenerateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageGenerateController>(
          () => ImageGenerateController(),
    );
  }
}
