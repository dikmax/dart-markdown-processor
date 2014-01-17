part of ast;

class Paragraph extends Element {
  Paragraph([List<Node> children = null]) : super(children);


  void accept(Visitor visitor) {
    visitor.beforeParagraph(this);
    super.accept(visitor);
    visitor.afterParagraph(this);
  }

  String toString() {
    return 'Paragraph(${super.toString()})';
  }
}