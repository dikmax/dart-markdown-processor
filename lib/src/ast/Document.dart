part of ast;

class Document extends Element {
  Document([children = null]) : super(children);

  String toString() {
    return 'Document(${super.toString()})';
  }
}