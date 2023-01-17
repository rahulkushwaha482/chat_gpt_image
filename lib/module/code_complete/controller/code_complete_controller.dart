import 'package:chat_gpt_api/app/chat_gpt.dart';
import 'package:chat_gpt_api/app/model/data_model/completion/completion.dart';
import 'package:chat_gpt_api/app/model/data_model/completion/completion_request.dart';
import 'package:chat_gpt_image/constant/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CodeCompleteController extends GetxController {
  late TextEditingController textEditingController;
  var textCom = "".obs;
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
    textCom.value = "";
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    textEditingController.clear();
    textEditingController.dispose();
  }

  void textComplete() async {
    if (textEditingController.text.isEmpty) {
      Get.snackbar('Enter text ', 'This filed is required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppTheme.kOpaqueOrange);
    } else {
      inProgress.value = true;
      textCom.value = "";
      Completion? completion = await chatGpt.textCompletion(
        request: CompletionRequest(
          prompt: textEditingController.text.toString(),
          maxTokens: 256,
        ),
      );

      textCom.value = completion?.choices![0].text ?? '';

      inProgress.value = false;
    }
  }
}
