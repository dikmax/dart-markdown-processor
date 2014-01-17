library markdownProcessor;

import 'src/ast.dart';
import 'src/parser.dart';

Document parseMarkdown(String markdown) {
  final List<String> lines = markdown.replaceAll('\r\n','\n').split('\n');

  var documentParser = new DocumentParser();
  var blockParseResult = documentParser.parse(lines);

  return blockParseResult.result;
}