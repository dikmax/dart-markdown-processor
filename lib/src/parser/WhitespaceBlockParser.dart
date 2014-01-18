part of parser;

/// Parses paragraphs of regular text.
class WhitespaceBlockParser extends AbstractBlockParser<String> {
  static final WhitespaceBlockParser _instance = new WhitespaceBlockParser._internal();

  factory WhitespaceBlockParser() {
    return _instance;
  }

  WhitespaceBlockParser._internal();

  static final _REGEXP = new RegExp(r'^\s*$');

  BlockParseResult<String> parse(Iterable<String> tokens) {
    ParseResult<Iterable<String>, Iterable<String>> result = _pc.takeWhile(
        tokens, (token) => _REGEXP.hasMatch(token)
    );

    return new BlockParseResult<String>(result.tokens, result.result.toList().join('\n'));
  }
}

WhitespaceBlockParser _wbp = new WhitespaceBlockParser();