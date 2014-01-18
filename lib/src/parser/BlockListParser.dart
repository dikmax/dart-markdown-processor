part of parser;

class BlockListParser extends AbstractBlockParser<List<Element>>{
// Singleton
  static final _instance = new BlockListParser._internal();

  factory BlockListParser() {
    return _instance;
  }

  BlockListParser._internal();

  // Parsers
  static List<AbstractBlockParser> get parsers {
    if (_parsers == null) {
      _parsers = [
          new SetextHeaderParser(),
          new AtxHeaderParser(),
          new BlockquoteParser(),
          new IdentedCodeParser(),
          new FencedCodeParser(),
          new ParagraphParser()
      ];
    }

    return _parsers;
  }

  static List<AbstractBlockParser> _parsers;


  BlockParseResult<List<Element>> parse(Iterable<String> tokens) {
    List<Element> parseResult = <Element>[];

    BlockParseResult<Element> result;

    var l = parsers.length;
    do {
      for (var i = 0; i < l; ++i) {
        result = parsers[i].parse(tokens);
        if (result != null) {
          break;
        }
      }

      if (result == null) {
        break;
      }
      parseResult.add(result.result);
      tokens = result.tokens;
    } while (true);

    if (parseResult.length == 0) {
      return null;
    }
    return new BlockParseResult([], parseResult);
  }
}