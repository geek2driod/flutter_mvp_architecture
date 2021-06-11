import 'dart:io';

import 'package:data/export.dart';

class ReadDocumentUseCase {
  ReadDocumentUseCase(this.ocrRepo);

  OcrRepo ocrRepo;

  Future<String> readDocument(File image) async {
    final ReadDocumentResponse data = await ocrRepo.scanImage(image);

    String paragraph = '';
    data.response.paragraphs.forEach((element) {
      paragraph += element.paragraph + '\n';
    });

    return paragraph;
  }
}
