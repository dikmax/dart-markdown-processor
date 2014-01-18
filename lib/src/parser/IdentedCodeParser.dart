part of parser;

class IdentedCodeParser extends AbstractBlockParser<Code> {
  static final IdentedCodeParser _instance = new IdentedCodeParser._internal();

  factory IdentedCodeParser() {
    return _instance;
  }

  IdentedCodeParser._internal();

  static final _REGEXP = new RegExp(r'^(?: {4}|\t)(.*)$');

  BlockParseResult<Code> parse(Iterable<String> tokens) {
    if (tokens.length < 1) {
      return null;
    }

    ParseResult<Iterable<String>, Iterable<String>> result = _pc.takeWhile1AndMap(
        tokens, (token) {
          Match match = _REGEXP.firstMatch(token);
          if (match != null) {
            return match[1];
          }
          if (token.trim() == '') {
            return '';
          }
          return null;
        }
    );

    if (result == null) {
      return null;
    }

    List<String> lines = result.result.toList();

    while(lines.length > 0 && lines.last == '') {
      lines.removeLast();
    }

    Code code = new Code.idented([new Text(lines.join("\n"))]);

    return new BlockParseResult<Code>(result.tokens, code);
  }
}