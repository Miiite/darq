extension InterleaveExtension<T> on Iterable<T> {
  /// Returns the elements of this iterable interleaved with the elements of [other].
  ///
  /// The elements of the resulting iterable will consist of the first element of
  /// this iterable followed by the first element of [other], followed by the second
  /// element of this iterable, and so on until both iterables are fully consumed.
  ///
  /// If the iterables are not the same length, the remaining elements of the longer
  /// iterable will be appended to the end of the resulting iterable in iteration
  /// order.
  Iterable<T> interleave(Iterable<T> other) sync* {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }

    final iterator = this.iterator;
    final otherIterator = other.iterator;

    var iteratorClosed = iterator.moveNext();
    var otherIteratorClosed = otherIterator.moveNext();

    do {
      if (!iteratorClosed) yield iterator.current;
      if (!otherIteratorClosed) yield otherIterator.current;
    } while (!(iteratorClosed && otherIteratorClosed));
  }
}