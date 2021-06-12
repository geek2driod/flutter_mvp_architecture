import 'package:domain/entities/export.dart';
import 'package:mvp_skeleton/export.dart';

mixin LibraryView on IView {}

abstract class LibraryPresenter extends IPresenter<LibraryView> {
  void init();

  List<DocumentEntity> getDocuments();
}
