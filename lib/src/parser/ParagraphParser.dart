part of parser;

/// Parses paragraphs of regular text.
class ParagraphParser extends AbstractBlockParser<Paragraph> {
  static final ParagraphParser _instance = new ParagraphParser._internal();

  factory ParagraphParser() {
    return _instance;
  }

  ParagraphParser._internal();

  BlockParseResult<Paragraph> parse(Iterable<String> tokens) {
    ParseResult<Iterable<String>, Iterable<String>> result = _bpc.takeWhile1(
        tokens, (token) => token.isNotEmpty
    );

    if (result == null) {
      return null;
    }

    ParseResult<Iterable<String>, Iterable<String>> result2 = _bpc.skipWhile(
        result.tokens, (token) => token.isEmpty
    );

    var paragraph = new Paragraph([new Text(result.result.toList().join('\n'))]);
    return new BlockParseResult<Paragraph>(result2.tokens, paragraph);
  }
}
