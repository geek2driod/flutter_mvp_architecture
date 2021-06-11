import '../../export.dart';

class SplashPresenterImpl extends SplashPresenter {
  @override
  void init() {
    //wait for 5 seconds and then go to the home page.
    Future.delayed(Duration(seconds: 5)).then((value) {
      view.openHomePage();
    });
  }
}
