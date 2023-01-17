import 'package:chat_gpt_api/app/chat_gpt.dart';
import 'package:chat_gpt_api/app/model/data_model/image/image_request.dart';
import 'package:chat_gpt_api/app/model/data_model/image/images.dart';
import 'package:chat_gpt_image/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';

class ImageGenerateController extends GetxController {
  late TextEditingController textEditingController;
  var image = "".obs;
  var inProgress = false.obs;
  final chatGpt = ChatGPT.builder(
    token:
        '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', // generate token from https://beta.openai.com/account/api-keys
  );

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textEditingController = TextEditingController();
    image.value = "";
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    textEditingController.clear();
    textEditingController.dispose();
  }

  void imageGeneration() async {

    if(textEditingController.text.isEmpty){
      Get.snackbar(
        'Enter text to generate Image',
        'This filed is required',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.kOpaqueOrange
      );
    }else{
      inProgress.value = true;
      Images? images = await chatGpt.generateImage(
        request: ImageRequest(
          prompt: textEditingController.text.toString(),
        ),
      );

      image.value = images?.data?[0].url ?? '';
      inProgress.value = false;
      textEditingController.text = "";

      if (kDebugMode) {
        print(images?.data?[0].url);
      }
    }



  }

  void downloadImage(String image) async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(image);
      if (imageId == null) {
        return;
      }


      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);

      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);

      // var path = await ImageDownloader.findPath(imageId);
      // await ImageDownloader.open(path!);


      Get.snackbar(
          'Image Downloaded',
          'Image is downloaded at path $path ',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppTheme.kGreen
      );
    } on PlatformException catch (error) {
      print(error);
    }
  }
}
