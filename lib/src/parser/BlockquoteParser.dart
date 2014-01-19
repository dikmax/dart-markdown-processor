part of parser;

class BlockquoteParser extends AbstractBlockParser<Blockquote> {
  static final BlockquoteParser _instance = new BlockquoteParser._internal();

  factory BlockquoteParser() {
    return _instance;
  }

  BlockquoteParser._internal();

  static final _REGEXP = new RegExp(r'^(> ?)?(.*)$');

  BlockParseResult<Blockquote> parse(Iterable<String> tokens) {
    if (tokens.length < 1 || tokens.first.length < 1 || tokens.first[0] != '>') {
      return null;
    }

    ParseResult<Iterable<String>, Iterable<String>> result = _pc.takeWhile1(
        tokens, (token) => token.isNotEmpty
    );

    if (result == null) {
      return null;
    }

    Iterable<String> contents = result.result.map((token) {
      Match match = _REGEXP.firstMatch(token);

      if (match == null) {
        return token;
      }

      return match[2];
    });

    BlockListParser parser = new BlockListParser();
    BlockParseResult<List<Element>> parseResult = parser.parse(contents);
    if (parseResult == null) {
      return null;
    }

    ParseResult<Iterable<String>, String> result2 = _wbp.parse(result.tokens);

    var blockquote = new Blockquote(parseResult.result);
    return new BlockParseResult<Blockquote>(result2.tokens, blockquote);
  }
}