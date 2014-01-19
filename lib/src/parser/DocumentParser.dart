part of parser;

class DocumentParser extends AbstractBlockParser<Document> {
  // Singleton
  static final _instance = new DocumentParser._internal();

  factory DocumentParser() {
    return _instance;
  }

  DocumentParser._internal();

  BlockParseResult<Document> parse(Iterable<String> tokens) {
    // Check for empty document
    if (tokens.length < 1 || (tokens.length == 1 && tokens.first.trim() == '')) {
      return new BlockParseResult([], new Document([]));
    }

    BlockListParser parser = new BlockListParser();
    BlockParseResult<List<Element>> result = parser.parse(tokens);
    if (result == null) {
      return null;
    }

    return new BlockParseResult([], new Document(result.result));
  }
}