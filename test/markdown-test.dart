library markdownTest;

import 'package:unittest/unittest.dart';
import '../lib/markdown.dart';
import '../lib/src/ast.dart';
import '../lib/src/renderer.dart';
import 'dart:io';

void _parseTest(String description, String markdown, String expected) {
  test(description, () {
    expect(parseMarkdown(markdown).toString(), wrapMatcher(expected));
  });
}

void main() {
  group('Parsers', () {
    group('Block parsers', () {
      _parseTest("Empty document",
        "", 'Document([])');
      _parseTest("One paragraph",
        "Text",
        'Document([Paragraph([\'Text\'])])');

      _parseTest("One paragraph with empty lines",
        "\n\n\nText\n\n\n",
        'Document([Paragraph([\'Text\'])])');

      _parseTest("Two paragraphs",
        "Line 1\nLine 2\n\n\nLine 3\nLine 4",
        'Document([Paragraph([\'Line 1\nLine 2\']), Paragraph([\'Line 3\nLine 4\'])])');
    });

  });

  group('Renderers', () {

  });
  /*File testFile = new File('test.md');
  var string = testFile.readAsStringSync();
  Markdown md = new Markdown();
  print(md.render(parseMarkdown(string)));

  Html html = new Html();
  print(html.render(parseMarkdown(string)));*/
}
