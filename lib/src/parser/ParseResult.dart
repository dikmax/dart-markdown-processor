part of parser;

class ParseResult<T, R> {
  T tokens;
  R result;

  ParseResult(this.tokens, this.result);
}

class BlockParseResult<R> extends ParseResult<Iterable<String>, R> {
  BlockParseResult(tokens, result) : super(tokens, result);
}
