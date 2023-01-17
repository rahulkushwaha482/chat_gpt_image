
import 'package:chat_gpt_image/module/code_complete/binding/code_complete_binding.dart';
import 'package:chat_gpt_image/module/code_complete/view/code_complete_view.dart';
import 'package:chat_gpt_image/module/image_gererate/view/image_generate_view.dart';
import 'package:get/get.dart';

import '../module/home/binding/home_binding.dart';
import '../module/home/view/home_view.dart';
import '../module/image_gererate/binding/image_generate_binding.dart';
import '../module/splash/binding/splash_binding.dart';
import '../module/splash/view/splash_view.dart';
part 'app_routes.dart';

class AppPages{

  AppPages._();
  static const INITIAL = Routes.SPLASH;
  static final routes = [

    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.IMAGEGENERATE,
      page: () => ImageGenerateView(),
      binding: ImageGenerateBinding(),
    ),

    GetPage(
      name: _Paths.CODECOMPLETE,
      page: () => CodeCompleteView(),
      binding: CodeCompleteBinding(),
    ),



  ];

}