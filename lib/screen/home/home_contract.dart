import 'dart:io';

import 'package:mvp_skeleton/base/base_mvp.dart';

mixin HomeView on IView{

}

abstract class HomePresenter extends IPresenter<HomeView> {

  Future readDocument(File image);

}