import 'dart:io';

import 'package:mvp_skeleton/export.dart';

mixin CaptureView on IView{

  void showImagePreview();
  void showLiveCameraView();
  void showDocumentView();

}

abstract class CapturePresenter extends IPresenter<CaptureView> {

  Future readDocument(File image);
  String getDocumentText();
  void onSaveTap();
}