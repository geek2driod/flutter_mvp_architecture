import 'dart:io';
import 'package:domain/use_case/export.dart';
import '../../export.dart';

class CapturePresenterImpl extends CapturePresenter{

  CapturePresenterImpl(this.readDocumentUseCase);

  final ReadDocumentUseCase readDocumentUseCase;

  String lastScannedData = '';
  @override
  Future readDocument(File image) async {
    try {
      view.showLoader();
      lastScannedData = await readDocumentUseCase.readDocument(image);
      view.hideLoader();
    }catch(e){
      print(e.toString());
    }

  }

  @override
  String getDocumentText() => lastScannedData;

  @override
  void onSaveTap() {

  }


}