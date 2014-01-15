part of parser;

/// Parses paragraphs of regular text.
class AtxHeaderParser extends AbstractBlockParser<Paragraph> {
  static final AtxHeaderParser _instance = new AtxHeaderParser._internal();

  static final _REGEXP = new RegExp(r'^(#{1,6}) *(.+) *#*$');

  factory AtxHeaderParser() {
    return _instance;
  }

  AtxHeaderParser._internal();

  BlockParseResult<Header> parse(Iterable<String> tokens) {
    if (tokens.length < 1 || tokens.first.isEmpty) {
      return null;
    }

    Match match = _REGEXP.firstMatch(tokens.first);
    if (match == null) {
      return null;
    }

    ParseResult<Iterable<String>, Iterable<String>> result = _bpc.skipWhile(
        tokens.skip(1), (token) => token.isEmpty
    );

    var header = new Header(HeaderStyle.ATX, match[1].length, [new Text(match[2])]);;
    return new BlockParseResult<Header>(result.tokens, header);
  }
}
