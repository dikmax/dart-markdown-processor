part of parser;

class DocumentParser extends AbstractBlockParser<Document> {
  // Singleton
  static final _instance = new DocumentParser._internal();

  factory DocumentParser() {
    return _instance;
  }

  DocumentParser._internal();

  BlockParseResult<Document> parse(Iterable<String> tokens) {
    BlockListParser parser = new BlockListParser();
    BlockParseResult<List<Element>> result = parser.parse(tokens);
    if (result == null) {
      return null;
    }

    return new BlockParseResult([], new Document(result.result));
  }
}