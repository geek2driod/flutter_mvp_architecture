import 'dart:io';

import 'package:mvp_skeleton/export.dart';

mixin CaptureView on IView{


}

abstract class CapturePresenter extends IPresenter<IView> {

  Future readDocument(File image);
  String getDocumentText();
  void onSaveTap();
}