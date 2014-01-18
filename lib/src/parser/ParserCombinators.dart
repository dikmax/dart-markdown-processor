part of parser;

class ParserCombinators<E, T extends Iterable<E>> {
  ParseResult<T, T> takeWhile1(T tokens, ElementPredicate<E> predicate) {
    if (tokens.length == 0 || !predicate(tokens.first)) {
      return null;
    }

    SplitIterable<E> iterable = new SplitIterable(tokens, predicate);
    return new ParseResult<T, T>(iterable.complementIterable, iterable);
  }

  ParseResult<T, T> takeWhile(T tokens, ElementPredicate<E> predicate) {
    SplitIterable<E> iterable = new SplitIterable(tokens, predicate);
    return new ParseResult<T, T>(iterable.complementIterable, iterable);
  }

  ParseResult<T, T> takeWhile1AndMap(T tokens, ElementMapPredicate<E> predicate) {
    if (tokens.length == 0 || predicate(tokens.first) == null) {
      return null;
    }

    SplitMapIterable<E> iterable = new SplitMapIterable(tokens, predicate);
    return new ParseResult<T, T>(iterable.complementIterable, iterable);
  }

  ParseResult<T, T> takeWhileAndMap(T tokens, ElementMapPredicate<E> predicate) {
    SplitMapIterable<E> iterable = new SplitMapIterable(tokens, predicate);
    return new ParseResult<T, T>(iterable.complementIterable, iterable);
  }

  ParseResult<T, T> skipWhile1(T tokens, ElementPredicate<E> predicate) {
    if (tokens.length == 0 || !predicate(tokens.first)) {
      return null;
    }

    return new ParseResult<T, T>(tokens.skipWhile(predicate), tokens.takeWhile(predicate));
  }

  ParseResult<T, T> skipWhile(T tokens, ElementPredicate<E> predicate) {
    return new ParseResult<T, T>(tokens.skipWhile(predicate), null);
  }
}

ParserCombinators _pc = new ParserCombinators<String, Iterable<String>>();
