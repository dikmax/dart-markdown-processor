part of parser;

typedef bool Predicate<E>(E predicate);

class ParserCombinators<E, T extends Iterable<E>> {
  ParseResult<T, T> takeWhile1(T tokens, Predicate predicate) {
    if (tokens.length == 0 || !predicate(tokens.first)) {
      return null;
    }

    return new ParseResult<T, T>(tokens.skipWhile(predicate), tokens.takeWhile(predicate));
  }

  ParseResult<T, T> takeWhile(T tokens, Predicate predicate) {
    return new ParseResult<T, T>(tokens.skipWhile(predicate), tokens.takeWhile(predicate));
  }

  ParseResult<T, T> skipWhile1(T tokens, Predicate predicate) {
    if (tokens.length == 0 || !predicate(tokens.first)) {
      return null;
    }

    return new ParseResult<T, T>(tokens.skipWhile(predicate), tokens.takeWhile(predicate));
  }

  ParseResult<T, T> skipWhile(T tokens, Predicate predicate) {
    return new ParseResult<T, T>(tokens.skipWhile(predicate), null);
  }
}

ParserCombinators _bpc = new ParserCombinators<String, Iterable<String>>();
