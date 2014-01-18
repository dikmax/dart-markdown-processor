part of renderer;

class Html extends Abstract {

  Html() : super();

  String render(Document document) {
    document.accept(this);

    return _sb.toString();
  }

  void text(Text text) {
    _sb.write(HTML_ESCAPE.convert(text.text));
  }

  void beforeBlockquote(Blockquote blockquote) {
    _sb.write('<blockquote>');
  }

  void afterBlockquote(Blockquote blockquote) {
    _sb.write('</blockquote>');
  }

  void beforeHeader(Header header) {
    _sb.write('<h${header.level}>');
  }

  void afterHeader(Header header) {
    _sb.write('</h${header.level}>');
  }

  void beforeParagraph(Paragraph paragraph) {
    _sb.write('<p>');
  }

  void afterParagraph(Paragraph paragraph) {
    _sb.write('</p>');
  }

}