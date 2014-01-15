part of ast;

class Blockquote extends Element {
  Blockquote([List<Node> children = null]) : super(children);

  String toString() {
    return 'Blockquote(${super.toString()})';
  }
}