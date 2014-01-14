part of parser;

class DocumentParser extends AbstractBlockParser<Document> {
  static final _instance = new DocumentParser._internal();

  factory DocumentParser() {
    return _instance;
  }

  DocumentParser._internal();

  BlockParseResult<Document> parse(Iterable<String> tokens) {
    Document document = new Document();

    var paragraphParser = new ParagraphParser();
    BlockParseResult<ParagraphElement> paragraphResult;
    do {
      paragraphResult = paragraphParser.parse(tokens);

      if (paragraphResult == null) {
        break;
      }
      document.children.add(paragraphResult.result);
      tokens = paragraphResult.tokens;
    } while (true);

    if (document.children.length == 0) {
      return null;
    }
    return new BlockParseResult([], document);
  }
}