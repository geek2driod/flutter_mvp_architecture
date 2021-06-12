import 'dart:io';

import 'package:data/export.dart';
import 'package:domain/entities/document_entity.dart';

class ReadDocumentUseCase {
  ReadDocumentUseCase(this.ocrRepo);

  final OcrRepo ocrRepo;
  final List<DocumentEntity> savedDocument = [];

  void init({bool refresh = false}) {
    //In case we have already populated the data
    //then there is no need to fetch it again.
    if (!refresh && savedDocument.isNotEmpty) return;

    if (refresh) savedDocument.clear();

    final List<Document> localData = ocrRepo.loadLocalData();

    if (localData == null || localData.isEmpty) return;

    final documents = localData.map(
      (e) => DocumentEntity.map(
        text: e.documentText,
        timeStamp: e.timeStamp,
      ),
    );

    savedDocument.addAll(documents);
  }

  Future<String> readDocument(File image) async {
    final ReadDocumentResponse data = await ocrRepo.scanImage(image);

    String paragraph = '';
    data.response.paragraphs.forEach((element) {
      paragraph += element.paragraph + ' ';
    });

    return paragraph;
  }

  void saveDocument(String documentText) {
    ocrRepo.saveDocument(documentText);
  }
}
