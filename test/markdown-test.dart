library markdownTest;

import 'package:unittest/unittest.dart';
import '../lib/markdown.dart';
import '../lib/src/ast.dart';
import '../lib/src/renderer.dart';
import 'dart:io';

void main() {
  File testFile = new File('test.md');
  var string = testFile.readAsStringSync();
  Markdown md = new Markdown();
  print(md.render(parseMarkdown(string)));

  /*Html html = new Html();
  print(html.render(parseMarkdown(string)));*/
}
