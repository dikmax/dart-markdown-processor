part of parser;

/// Parses paragraphs of regular text.
class ParagraphParser extends AbstractBlockParser<ParagraphElement> {
  static final ParagraphParser _instance = new ParagraphParser._internal();

  factory ParagraphParser() {
    return _instance;
  }

  ParagraphParser._internal();

  BlockParseResult<ParagraphElement> parse(Iterable<String> tokens) {
    ParseResult<Iterable<String>, Iterable<String>> result = _bpc.takeWhile1(
        tokens, (token) => token.isNotEmpty
    );

    if (result == null) {
      return null;
    }

    ParseResult<Iterable<String>, Iterable<String>> result2 = _bpc.skipWhile(
        result.tokens, (token) => token.isEmpty
    );

    var paragraphElement = new ParagraphElement([new Text(result.result.toList().join('\n'))]);
    return new BlockParseResult<ParagraphElement>(result2.tokens, paragraphElement);
  }
}
