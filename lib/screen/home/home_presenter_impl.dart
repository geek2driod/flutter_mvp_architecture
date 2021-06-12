import 'dart:io';

import 'package:domain/export.dart';
import 'package:mvp_skeleton/screen/home/home_contract.dart';

class HomePresenterImpl extends HomePresenter {
  HomePresenterImpl(this.readDocumentUseCase);

  final ReadDocumentUseCase readDocumentUseCase;

  @override
  void init() {
    readDocumentUseCase.init(refresh: true);
  }

  @override
  void onSaveDocumentTextTap() => view.changeTab(1);

  @override
  void onTryNowTap() => view.changeTab(0);



}
