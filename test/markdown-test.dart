library markdownTest;

import 'package:unittest/unittest.dart';
import '../lib/markdown.dart';
import 'dart:io';

void main() {
  File testFile = new File('test.md');
  var string = testFile.readAsStringSync();
  parseMarkdown(string);
}
