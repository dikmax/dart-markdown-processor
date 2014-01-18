part of ast;

class CodeStyle {
  static const IDENTED = const CodeStyle._(0);
  static const FENCED = const CodeStyle._(1);

  static get values => [IDENTED, FENCED];

  final int value;

  const CodeStyle._(this.value);
}

class Code extends Element {
  final CodeStyle style;

  Code(this.style, [List<Node> children = null]) : super(children);

  void accept(Visitor visitor) {
    visitor.beforeCode(this);
    super.accept(visitor);
    visitor.afterCode(this);
  }

  String toString() {
    return 'Code(${super.toString()})';
  }
}