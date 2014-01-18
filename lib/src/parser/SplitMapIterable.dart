part of parser;

typedef E ElementMapPredicate<E>(E element);

class SplitMapIterable<E> extends IterableBase<E> {
  final Iterable<E> _iterable;
  final ElementMapPredicate _f;
  List<E> _list;
  List<E> _complementList;

  SplitMapIterable(this._iterable, this._f);

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
      if (take) {
        E mapped = _f(current);
        if (mapped != null) {
          _list.add(mapped);
        } else {
          take = false;
          _complementList.add(current);
        }
      } else {
        _complementList.add(current);
      }
    }
  }
}