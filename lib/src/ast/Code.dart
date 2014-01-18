part of ast;

class CodeStyle {
  static const IDENTED = const CodeStyle._(0);
  static const FENCED = const CodeStyle._(1);

  static get values => [IDENTED, FENCED];

  final int value;

  const CodeStyle._(this.value);
}

class Code extends Element {
  CodeStyle style;
  String _fence;

  Code.idented([List<Node> children = null]) : style = CodeStyle.IDENTED, _fence = null, super(children);
  Code.fenced(this._fence, [List<Node> children = null]) : style = CodeStyle.FENCED, super(children);

  String get fence => _fence;
  void set fence (String f) {
    if (style == CodeStyle.IDENTED) {
      _fence = null;
      return;
    }
    if (new RegExp(r'^`{3,}|~{3,}$').firstMatch(f) == null) {
      _fence = '```';
    } else {
      _fence = f;
    }
  }

  void accept(Visitor visitor) {
    visitor.beforeCode(this);
    super.accept(visitor);
    visitor.afterCode(this);
  }

  String toString() {
    return 'Code(${super.toString()})';
  }
}