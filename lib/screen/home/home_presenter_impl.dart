import 'dart:io';

import 'package:domain/export.dart';
import 'package:mvp_skeleton/screen/home/home_contract.dart';

class HomePresenterImpl extends HomePresenter {
  HomePresenterImpl(this.readDocumentUseCase);

  final ReadDocumentUseCase readDocumentUseCase;

  @override
  Future readDocument(File image) async {
    readDocumentUseCase.readDocument(image);

  }


}
