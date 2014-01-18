part of renderer;

abstract class Abstract implements Visitor {
  StringBuffer _sb;

  DoubleLinkedQueue<StringBuffer> _stack;

  Abstract() : _sb = new StringBuffer(), _stack = new DoubleLinkedQueue<StringBuffer>();

  String render(Document document);

  void pushState() {
    _stack.addLast(_sb);
    _sb = new StringBuffer();
  }

  String popState() {
    String result = _sb.toString();
    _sb = _stack.removeLast();
    return result;
  }

  void text(Text text) {}

  void beforeBlockquote(Blockquote blockquote) {}
  void afterBlockquote(Blockquote blockquote) {}

  void beforeDocument(Document document) {}
  void afterDocument(Document document) {}

  void beforeHeader(Header header) {}
  void afterHeader(Header header) {}

  void beforeParagraph(Paragraph paragraph) {}
  void afterParagraph(Paragraph paragraph) {}
}
