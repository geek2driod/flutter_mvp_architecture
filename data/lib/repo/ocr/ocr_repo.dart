import 'dart:io';
import 'package:data/export.dart';

mixin OcrRepo {

  Future<ReadDocumentResponse> scanImage(File image);

  List<Document> saveDocument(String documentText);

  List<Document> loadLocalData();

}