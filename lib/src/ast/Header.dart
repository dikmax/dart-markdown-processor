part of ast;

class HeaderStyle {
  static const SETEXT = const HeaderStyle._(0);
  static const ATX = const HeaderStyle._(1);

  static get values => [SETEXT, ATX];

  final int value;

  const HeaderStyle._(this.value);
}

class Header extends Element {
  HeaderStyle style;
  int level;

  Header(this.style, this.level, [List<Node> children = null]) : super(children);
  Header.atx(this.level, [List<Node> children = null]) : style = HeaderStyle.ATX, super(children);
  Header.setext(this.level, [List<Node> children = null]) : style = HeaderStyle.SETEXT, super(children);

  void accept(Visitor visitor) {
    visitor.beforeHeader(this);
    super.accept(visitor);
    visitor.afterHeader(this);
  }

  String toString() {
    if (style == HeaderStyle.SETEXT) {
      return 'Header${level}(SETEXT, ${super.toString()})';
    } else {
      return 'Header${level}(ATX, ${super.toString()})';
    }
  }
}