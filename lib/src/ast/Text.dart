part of ast;

class Text extends Node {
  final String text;
  Text(this.text);

  void accept(Visitor visitor) {
    visitor.text(this);
  }

  String toString() {
    return "'${text}'"; // TODO escape strings
  }
}
