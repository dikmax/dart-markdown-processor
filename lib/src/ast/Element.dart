part of ast;

abstract class Element extends Node {
  final List<Node> children;

  Element([List<Node> children = null]) : this.children = children == null ? [] : children;

  String toString() {
    return children.toString();
  }
}
