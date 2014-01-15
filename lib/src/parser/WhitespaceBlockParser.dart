part of parser;

/// Parses paragraphs of regular text.
class WhitespaceBlockParser extends AbstractBlockParser<String> {
  static final WhitespaceBlockParser _instance = new WhitespaceBlockParser._internal();

  static final _REGEXP = new RegExp(r'^\s*$');

  factory WhitespaceBlockParser() {
    return _instance;
  }

  WhitespaceBlockParser._internal();

  BlockParseResult<Header> parse(Iterable<String> tokens) {
    ParseResult<Iterable<String>, Iterable<String>> result = _bpc.takeWhile(
        tokens, (token) => _REGEXP.hasMatch(token)
    );

    return new BlockParseResult<String>(result.tokens, result.result.toList().join('\n'));
  }
}

WhitespaceBlockParser _wbp = new WhitespaceBlockParser();