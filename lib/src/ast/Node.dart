part of ast;

abstract class Node {
  void accept(Visitor visitor);
}
