class DocumentEntity {
  final String documentText;
  final String timeStamp;

  DocumentEntity({
    this.documentText,
    this.timeStamp,
  });

  factory DocumentEntity.map({
    String text,
    String timeStamp,
  }) =>
      DocumentEntity(
        documentText: text,
        timeStamp: timeStamp,
      );
}
