part of renderer;

class Markdown extends Abstract {
  StringBuffer _sb;

  String render(Document document) {
    _sb = new StringBuffer();
    document.accept(this);
    return _sb.toString();
  }

  void text(Text text) {
    _sb.write(text.text);
  }

  void beforeBlockquote(Blockquote blockquote) {
    _sb.write('> ');
  }

  void afterBlockquote(Blockquote blockquote) {
    _sb.write('\n\n');
  }

  void beforeHeader(Header header) {
    if (header.style == HeaderStyle.ATX) {
      _sb.write('######'.substring(0, header.level) + ' ');
    }
  }

  void afterHeader(Header header) {
    if (header.style == HeaderStyle.SETEXT) {
      _sb
        ..writeln()
        ..write(header.level == 1 ? '===' : '---');
    }
    _sb.write('\n\n');
  }

  void afterParagraph(Paragraph paragraph) {
    _sb.write('\n\n');
  }
}
