import 'dart:convert';
import 'dart:io';
import 'package:data/export.dart';
import 'package:data/network/endpoints.dart';
import 'package:data/network/network_helper.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http/http.dart' as http;
import 'package:data/repo/ocr/ocr_repo.dart';

class OcrRepoImpl implements OcrRepo {
  OcrRepoImpl(this.networkHelper, this.storage);

  final NetworkHelper networkHelper;
  final Storage storage;

  @override
  Future<ReadDocumentResponse> scanImage(File image) async {
    var files = new List<http.MultipartFile>();
    var fileName = image.path.split("/").last;
    var mimeType = mime(fileName) ?? "image/jpeg";

    files.add(
      http.MultipartFile.fromBytes(
        "photo",
        image.readAsBytesSync(),
        filename: image.path.split("/").last,
        contentType: MediaType.parse(mimeType),
      ),
    );
    final response = await networkHelper.multipart(
      readDocumentAPI,
      files: files,
      gzip: false,
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw 'Unable to fetch the response!';
    }

    return ReadDocumentResponse.fromJson(
      jsonDecode(response.body.toString()),
    );
  }

  @override
  List<Document> saveDocument(String documentText) {
    List<String> documents = storage.getList(StorageKeys.documents);

    if (documents == null) {
      documents = [];
    }

    final document = Document(
      timeStamp: DateTime.now().toString(),
      documentText: documentText,
    );

    documents.insert(
      0,
      jsonEncode(
        document.toJson(),
      ),
    );

    storage.setList(StorageKeys.documents, documents);

    if (documents == null) return List.empty();

    return documents
        .map(
          (e) => Document.fromJson(
            jsonDecode(e),
          ),
        )
        .toList();
  }

  @override
  List<Document> loadLocalData() {
    final documents = storage.getList(StorageKeys.documents);

    if (documents == null) return List.empty();

    return documents
        .map(
          (e) => Document.fromJson(
            jsonDecode(e),
          ),
        )
        .toList();
  }
}
