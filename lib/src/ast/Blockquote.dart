part of ast;

class Blockquote extends Element {
  Blockquote([List<Node> children = null]) : super(children);

  void accept(Visitor visitor) {
    visitor.beforeBlockquote(this);
    super.accept(visitor);
    visitor.afterBlockquote(this);
  }

  String toString() {
    return 'Blockquote(${super.toString()})';
  }
}