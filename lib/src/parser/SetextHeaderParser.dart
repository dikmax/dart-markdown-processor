part of parser;

/// Parses paragraphs of regular text.
class SetextHeaderParser extends AbstractBlockParser<Paragraph> {
  static final SetextHeaderParser _instance = new SetextHeaderParser._internal();

  static final _REGEXP = new RegExp(r'^((=+)|(-+))$');

  factory SetextHeaderParser() {
    return _instance;
  }

  SetextHeaderParser._internal();

  BlockParseResult<Header> parse(Iterable<String> tokens) {
    if (tokens.length < 2 || tokens.first.isEmpty) {
      return null;
    }

    Match match = _REGEXP.firstMatch(tokens.elementAt(1));
    if (match == null) {
      return null;
    }

    ParseResult<Iterable<String>, String> result = _wbp.parse(tokens.skip(2));

    var header = new Header(HeaderStyle.SETEXT, match[1][0] == '=' ? 1 : 2, [new Text(tokens.first)]);;
    return new BlockParseResult<Header>(result.tokens, header);
  }
}
