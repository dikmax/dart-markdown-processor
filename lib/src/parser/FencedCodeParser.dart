part of parser;

class FencedCodeParser extends AbstractBlockParser<Code> {
  static final FencedCodeParser _instance = new FencedCodeParser._internal();

  factory FencedCodeParser() {
    return _instance;
  }

  FencedCodeParser._internal();

  static final _REGEXP = new RegExp(r'^(`{3,}|~{3,})(.*)$');

  BlockParseResult<Code> parse(Iterable<String> tokens) {
    if (tokens.length < 2) {
      return null;
    }

    Match match = _REGEXP.firstMatch(tokens.first);
    if (match == null) {
      return null;
    }

    String fence = match[1];

    ParseResult<Iterable<String>, Iterable<String>> result = _pc.takeWhile(
        tokens.skip(1), (token) => !token.startsWith(fence)
    );

    if (result == null || result.tokens.length < 1) {
      return null;
    }

    ParseResult<Iterable<String>, String> result2 = _wbp.parse(result.tokens.skip(1));

    Code code = new Code.fenced(fence, [new Text(result.result.join("\n"))]);

    return new BlockParseResult<Code>(result2.tokens, code);
  }
}