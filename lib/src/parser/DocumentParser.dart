part of parser;

class DocumentParser extends AbstractBlockParser<Document> {
  // Singleton
  static final _instance = new DocumentParser._internal();

  factory DocumentParser() {
    return _instance;
  }

  DocumentParser._internal();

  // Parsers
  static List<AbstractBlockParser> get parsers {
    if (_parsers == null) {
      _parsers = [
          new SetextHeaderParser(),
          new AtxHeaderParser(),
          new ParagraphParser()
      ];
    }

    return _parsers;
  }

  static List<AbstractBlockParser> _parsers;


  BlockParseResult<Document> parse(Iterable<String> tokens) {
    Document document = new Document();

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
      document.children.add(result.result);
      tokens = result.tokens;
    } while (true);

    if (document.children.length == 0) {
      return null;
    }
    return new BlockParseResult([], document);
  }
}