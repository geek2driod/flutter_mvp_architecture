import 'package:domain/entities/document_entity.dart';
import 'package:domain/export.dart';

import '../../export.dart';

class LibraryPresenterImpl extends LibraryPresenter {
  LibraryPresenterImpl(this.readDocumentUseCase);

  final ReadDocumentUseCase readDocumentUseCase;

  @override
  void init() {
    readDocumentUseCase.init(refresh: true);
  }

  @override
  List<DocumentEntity> getDocuments() => readDocumentUseCase.savedDocument;
}
