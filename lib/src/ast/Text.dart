part of ast;

class Text extends Node {
  final String text;
  Text(this.text);

  String toString() {
    return "'${text}'"; // TODO escape strings
  }
}
