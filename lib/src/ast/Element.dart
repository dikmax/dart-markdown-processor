part of ast;

abstract class Element extends Node {
  final List<Node> children;

  Element([children = null]) : this.children = children == null ? [] : children;

  String toString() {
    return children.toString();
  }
}
