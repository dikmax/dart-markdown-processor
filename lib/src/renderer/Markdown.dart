part of renderer;

class Markdown extends Abstract {

  Markdown() : super();

  String render(Document document) {
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
    } else {
      pushState();
    }
  }

  void afterHeader(Header header) {
    if (header.style == HeaderStyle.SETEXT) {
      String headerString = popState();
      _sb
        ..writeln(headerString)
        ..write(headerString.replaceAll(new RegExp(r'.'), header.level == 1 ? '=' : '-'));
    }
    _sb.write('\n\n');
  }

  void afterParagraph(Paragraph paragraph) {
    _sb.write('\n\n');
  }
}
