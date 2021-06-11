import '../../export.dart';

mixin SplashView {
  void openHomePage();
}

abstract class SplashPresenter extends IPresenter<SplashView>{

  void init();

}