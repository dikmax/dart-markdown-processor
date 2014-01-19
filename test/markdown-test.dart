library markdownTest;

import 'package:unittest/unittest.dart';
import '../lib/markdown.dart';
import '../lib/src/ast.dart';
import '../lib/src/renderer.dart';
import 'dart:io';

part 'html-converter-test.dart';

final RegExp _REGEXP = new RegExp(r'^Document\(([\s\S]*)\)$', multiLine: true);

void _parseTest(String description, String markdown, String expected) {
  test(description, () {
    var result = parseMarkdown(markdown).toString();
    Match match = _REGEXP.firstMatch(result);
    if (match == null) {
      expect(false, isTrue, reason: "No document description found.");
    } else {
      result = match[1];
      expect(result, wrapMatcher(expected));
    }
  });
}

void main() {
  group('Parsers', () {
    group('Base', () {
      _parseTest("Empty document",
      "", '[]');
    });
    group('Paragraph', () {
      _parseTest("One paragraph",
        "Text",
        '[Paragraph([\'Text\'])]');

      _parseTest("One paragraph with empty lines",
        "\n\n\nText\n\n\n",
        '[Paragraph([\'Text\'])]');

      _parseTest("Two paragraphs",
        "Line 1\nLine 2\n\n\nLine 3\nLine 4",
        '[Paragraph([\'Line 1\nLine 2\']), Paragraph([\'Line 3\nLine 4\'])]');
    });
    group('Header', () {
      _parseTest('Setext header 1',
        'Header 1\n===',
        '[Header1(SETEXT, [\'Header 1\'])]');
      _parseTest('Setext header 2',
        'Header 1\n---',
        '[Header2(SETEXT, [\'Header 1\'])]');
      _parseTest('Setext header 3',
        '---',
        '[Paragraph([\'---\'])]');
      _parseTest('Setext header 4',
        '=',
        '[Paragraph([\'=\'])]');

      _parseTest('Atx header 1',
        '# Header 1',
        '[Header1(ATX, [\'Header 1\'])]');
      _parseTest('Atx header 2',
        '##Header 2',
        '[Header2(ATX, [\'Header 2\'])]');
      _parseTest('Atx header 3',
        '###Header 3##########',
        '[Header3(ATX, [\'Header 3\'])]');
      _parseTest('Atx header 4',
        '####   Header 4   ##########',
        '[Header4(ATX, [\'Header 4\'])]');
      _parseTest('Atx header 5',
        '#####   Header 5   ',
        '[Header5(ATX, [\'Header 5\'])]');
      _parseTest('Atx header 6',
        '###### Header 6', '[Header6(ATX, [\'Header 6\'])]');
    });

  });

  group('Renderers', () {
    htmlConverterTest();
  });

  /*File testFile = new File('test.md');
  var string = testFile.readAsStringSync();
  Markdown md = new Markdown();
  print(md.render(parseMarkdown(string)));

  Html html = new Html();
  print(html.render(parseMarkdown(string)));*/
}
