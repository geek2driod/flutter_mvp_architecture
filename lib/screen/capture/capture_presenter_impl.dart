import 'dart:io';
import 'package:domain/use_case/export.dart';
import '../../export.dart';

class CapturePresenterImpl extends CapturePresenter {
  CapturePresenterImpl(this.readDocumentUseCase);

  final ReadDocumentUseCase readDocumentUseCase;

  String lastScannedData = '';

  @override
  Future readDocument(File image) async {
    try {
      view.showImagePreview();
      lastScannedData = await readDocumentUseCase.readDocument(image);
      view.showDocumentView();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  String getDocumentText() => lastScannedData;

  @override
  void onSaveTap() {
    readDocumentUseCase.saveDocument(lastScannedData);
    lastScannedData = '';
    view.showLiveCameraView();
  }
}
