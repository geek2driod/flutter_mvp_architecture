import 'package:flutter/foundation.dart';

class Document {
  final String timeStamp;
  final String documentText;

  Document({
    @required this.timeStamp,
    @required this.documentText,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    timeStamp: json['timeStamp'],
    documentText: json['documentText'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeStamp'] = this.timeStamp;
    data['documentText'] = this.documentText;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Document &&
          runtimeType == other.runtimeType &&
          timeStamp == other.timeStamp &&
          documentText == other.documentText;

  @override
  int get hashCode => timeStamp.hashCode ^ documentText.hashCode;
}
