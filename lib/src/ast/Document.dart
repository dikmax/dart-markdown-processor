part of ast;

class Document extends Element {
  Document([List<Node> children = null]) : super(children);

  void accept(Visitor visitor) {
    visitor.beforeDocument(this);
    super.accept(visitor);
    visitor.afterDocument(this);
  }

  String toString() {
    return 'Document(${super.toString()})';
  }
}