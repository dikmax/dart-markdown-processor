part of ast;

class ParagraphElement extends Element {
  ParagraphElement(children) : super(children);

  String toString() {
    return 'Paragraph(${super.toString()})';
  }
}