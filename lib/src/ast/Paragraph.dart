part of ast;

class Paragraph extends Element {
  Paragraph([List<Node> children = null]) : super(children);

  String toString() {
    return 'Paragraph(${super.toString()})';
  }
}