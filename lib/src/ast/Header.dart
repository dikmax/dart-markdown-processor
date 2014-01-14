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

  String toString() {
    return 'Header${level}(${super.toString()})';
  }
}