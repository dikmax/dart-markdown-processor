part of parser;

typedef bool ElementPredicate<E>(E element);

class SplitIterable<E> extends IterableBase<E>  {
  final Iterable<E> _iterable;
  final ElementPredicate _f;
  List<E> _list;
  List<E> _complementList;

  SplitIterable(this._iterable, this._f);

  Iterator<E> get iterator {
    if (_list == null) {
      _prepareLists();
    }

    return _list.iterator;
  }

  Iterable<E> get complementIterable {
    if (_complementList == null) {
      _prepareLists();
    }

    return _complementList;
  }

  void _prepareLists() {
    _list = <E>[];
    _complementList = <E>[];

    Iterator<E> it = _iterable.iterator;

    var take = true;
    while (it.moveNext()) {
      E current = it.current;
      if (take && _f(current)) {
        _list.add(current);
      } else {
        take = false;
        _complementList.add(current);
      }
    }
  }
}