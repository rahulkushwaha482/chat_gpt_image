import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  void codeComplete() {
    Get.toNamed(Routes.CODECOMPLETE);
  }

  void imageGenerate() {
    Get.toNamed(Routes.IMAGEGENERATE);
  }
}
