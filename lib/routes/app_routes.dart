part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const CODECOMPLETE = _Paths.CODECOMPLETE;
  static const IMAGEGENERATE = _Paths.IMAGEGENERATE;


}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const CODECOMPLETE = '/codecomplete';
  static const IMAGEGENERATE  = '/imagegenerate';

}