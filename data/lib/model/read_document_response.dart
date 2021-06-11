class ReadDocumentResponse {
  DocumentText response;

  ReadDocumentResponse({this.response});

  ReadDocumentResponse.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new DocumentText.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    return data;
  }
}

class DocumentText {
  List<Paragraphs> paragraphs;

  DocumentText({this.paragraphs});

  DocumentText.fromJson(Map<String, dynamic> json) {
    if (json['paragraphs'] != null) {
      paragraphs = new List<Paragraphs>();
      json['paragraphs'].forEach((v) {
        paragraphs.add(new Paragraphs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paragraphs != null) {
      data['paragraphs'] = this.paragraphs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paragraphs {
  String paragraph;
  String language;

  Paragraphs({this.paragraph, this.language});

  Paragraphs.fromJson(Map<String, dynamic> json) {
    paragraph = json['paragraph'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paragraph'] = this.paragraph;
    data['language'] = this.language;
    return data;
  }
}