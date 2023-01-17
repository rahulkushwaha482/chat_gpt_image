
import 'package:get/get.dart';
import '../controller/code_complete_controller.dart';

class CodeCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeCompleteController>(
          () => CodeCompleteController(),
    );
  }
}
