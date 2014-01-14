part of ast;

class Document extends Element {
  Document([List<Node> children = null]) : super(children);

  String toString() {
    return 'Document(${super.toString()})';
  }
}