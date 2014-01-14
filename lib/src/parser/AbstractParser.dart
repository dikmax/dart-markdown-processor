part of parser;

abstract class AbstractParser<E, T extends Iterable<E>, R> {
  ParseResult<T, R> parse(T tokens);
}
