part of renderer;

abstract class Abstract implements Visitor {
  void text(Text text) {}

  void beforeBlockquote(Blockquote blockquote) {}
  void afterBlockquote(Blockquote blockquote) {}

  void beforeDocument(Document document) {}
  void afterDocument(Document document) {}

  void beforeHeader(Header header) {}
  void afterHeader(Header header) {}

  void beforeParagraph(Paragraph paragraph) {}
  void afterParagraph(Paragraph paragraph) {}

  String render(Document document);


}
