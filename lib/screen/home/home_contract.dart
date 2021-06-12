import 'dart:io';

import 'package:mvp_skeleton/base/base_mvp.dart';

mixin HomeView on IView{
  void changeTab(int position);
}

abstract class HomePresenter extends IPresenter<HomeView> {
  void init();
  void onTryNowTap();
  void onSaveDocumentTextTap();

}