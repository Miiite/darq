[![pub package](https://img.shields.io/pub/v/darq.svg)](https://pub.dartlang.org/packages/darq)

A port of .NET's LINQ IEnumerable functions to Dart. This library adds a powerful `Enumerable` collection type to Dart that greatly increases convenience when modifying a collection as well as performance when dealing with large collections and complex modifications.

## API Reference

 - [Dart Docs](https://pub.dev/documentation/darq/latest/darq/darq-library.html)

## Lazy Execution

The power of `Enumerable` is that it supports modification to an underlying collection using lazy execution. This means that the enumerable only stores the data necessary to perform the modification and does not actually perform the modification until the enumerable is iterated over. No data is cached either, so unless you actually iterate over the enumerable, creating one is virtually free from both a memory and performance standpoint.

What's more, when multiple enumerable modifications are chained together, the iteration is done through them all simultaneously. This greatly eases the overhead of performing complex modifications on large collection sets.

## Usage

An `Enumerable` can be created out of any Dart collection type that extends `Iterable`. There are two ways to do so:

```dart
var sourceList = [0, 1, 2, 3, 4];

// Factory method
var factoryEnum = Enumerable.from(sourceList);

// Convenience method
var convenientEnum = E(sourceList);
```

You can also generate an `Enumerable` without needing a pre-existing collection using one of several factory methods:

```dart
// Creates an Enumerable with no values
var emptyEnum = Enumerable.empty();

// Creates an Enumerable containing 5 integers starting with the number 2
var rangeEnum = Enumerable.range(2, 5);

// Creates an Enumerable that contains 6 copies of the value 'a string'
var repeatEnum = Enumerable.repeat('a string', 6);
```

Once you have an `Enumerable`, you can call any of over 50 different methods on it to modify or analyze it. For example, you can map to a new value with `Select`:

```dart
var myEnum = E([1, 2, 3);
var mappedEnum = myEnum.Select((i) => i * 2);
// Values: [2, 4, 6]
```

...filter the elements with `Where`:

```dart
var myEnum = E([1, 2, 3);
var filteredEnum = myEnum.Where((i) => i.isOdd);
// Values: [1, 3]
```

...get only unique values with `Distinct`:

```dart
var myEnum = E([1, 1, 1, 2, 2, 3, 4, 5, 5, 5, 5, 5]);
var uniqueEnum = myEnum.Distinct();
// Values: [1, 2, 3, 4, 5]
```

...or even group elements together using `GroupBy`:

```dart
var myEnum = E([1, 2, 3, 4, 5, 6]);
var groupedEnum = myEnum.GroupBy((i) => i % 2);
// Values: [[1, 3, 5], [2, 4, 6]]
```

What's more, you can chain methods together, enabling virtually endless possibilities in a concise chain of method calls:

```dart
var myEnum = E([1, 2, 3, 4, 5, 6]);
var resultEnum = myEnum.Select((i) => i * 2)
                       .Where((i) => i > 4)
                       .Select((i) => i.toRadixString(16));
/// Values: ['6', '8', 'A', 'C']
```

To use the values, you can iterate over the `Enumerable` just like you would any other `Iterable` collection:

```dart
var myEnum = E([1, 2, 3);
for (var value in myEnum) {
    print(value);
}

// Output:
// 1
// 2
// 3
```

You can also easily convert the `Enumerable` back into a Dart collection type using `ToList`, `ToMap`, or `ToSet`:

```dart
var myEnum = E([1, 2, 3]);
var myList = myEnum.ToList();
// myList is a List<int> with the values of myEnum
```

## Full Function List

 - [Aggregate](https://pub.dev/documentation/darq/latest/darq/Enumerable/Aggregate.html)
 - [All](https://pub.dev/documentation/darq/latest/darq/Enumerable/All.html)
 - [Any](https://pub.dev/documentation/darq/latest/darq/Enumerable/Any.html)
 - [Append](https://pub.dev/documentation/darq/latest/darq/Enumerable/Append.html)
 - [Average](https://pub.dev/documentation/darq/latest/darq/Enumerable/Average.html)
 - [Cast](https://pub.dev/documentation/darq/latest/darq/Enumerable/Cast.html)
 - [Concat](https://pub.dev/documentation/darq/latest/darq/Enumerable/Concat.html)
 - [Contains](https://pub.dev/documentation/darq/latest/darq/Enumerable/Contains.html)
 - [Count](https://pub.dev/documentation/darq/latest/darq/Enumerable/Count.html)
 - [CountIf](https://pub.dev/documentation/darq/latest/darq/Enumerable/CountIf.html)
 - [DefaultIfEmpty](https://pub.dev/documentation/darq/latest/darq/Enumerable/DefaultIfEmpty.html)
 - [Distinct](https://pub.dev/documentation/darq/latest/darq/Enumerable/Distinct.html)
 - [ElementAt](https://pub.dev/documentation/darq/latest/darq/Enumerable/ElementAt.html)
 - [ElementAtOrDefault](https://pub.dev/documentation/darq/latest/darq/Enumerable/ElementAtOrDefault.html)
 - [Except](https://pub.dev/documentation/darq/latest/darq/Enumerable/Except.html)
 - [First](https://pub.dev/documentation/darq/latest/darq/Enumerable/First.html)
 - [FirstOrDefault](https://pub.dev/documentation/darq/latest/darq/Enumerable/FirstOrDefault.html)
 - [GroupBy](https://pub.dev/documentation/darq/latest/darq/Enumerable/GroupBy.html)
 - [GroupByValue](https://pub.dev/documentation/darq/latest/darq/Enumerable/GroupByValue.html)
 - [GroupJoin](https://pub.dev/documentation/darq/latest/darq/Enumerable/GroupJoin.html)
 - [GroupSelect](https://pub.dev/documentation/darq/latest/darq/Enumerable/GroupSelect.html)
 - [GroupSelectValue](https://pub.dev/documentation/darq/latest/darq/Enumerable/GroupSelectValue.html)
 - [Intersect](https://pub.dev/documentation/darq/latest/darq/Enumerable/Intersect.html)
 - [Join](https://pub.dev/documentation/darq/latest/darq/Enumerable/Join.html)
 - [Last](https://pub.dev/documentation/darq/latest/darq/Enumerable/Last.html)
 - [LastOrDefault](https://pub.dev/documentation/darq/latest/darq/Enumerable/LastOrDefault.html)
 - [Max](https://pub.dev/documentation/darq/latest/darq/Enumerable/Max.html)
 - [Min](https://pub.dev/documentation/darq/latest/darq/Enumerable/Min.html)
 - [OfType](https://pub.dev/documentation/darq/latest/darq/Enumerable/OfType.html)
 - [OrderBy](https://pub.dev/documentation/darq/latest/darq/Enumerable/OrderBy.html)
 - [OrderByDescending](https://pub.dev/documentation/darq/latest/darq/Enumerable/OrderByDescending.html)
 - [Prepend](https://pub.dev/documentation/darq/latest/darq/Enumerable/Prepend.html)
 - [Reverse](https://pub.dev/documentation/darq/latest/darq/Enumerable/Reverse.html)
 - [Select](https://pub.dev/documentation/darq/latest/darq/Enumerable/Select.html)
 - [SelectMany](https://pub.dev/documentation/darq/latest/darq/Enumerable/SelectMany.html)
 - [SequenceEqual](https://pub.dev/documentation/darq/latest/darq/Enumerable/SequenceEqual.html)
 - [Single](https://pub.dev/documentation/darq/latest/darq/Enumerable/Single.html)
 - [SingleOrDefault](https://pub.dev/documentation/darq/latest/darq/Enumerable/SingleOrDefault.html)
 - [Skip](https://pub.dev/documentation/darq/latest/darq/Enumerable/Skip.html)
 - [SkipWhile](https://pub.dev/documentation/darq/latest/darq/Enumerable/SkipWhile.html)
 - [Sum](https://pub.dev/documentation/darq/latest/darq/Enumerable/Sum.html)
 - [Take](https://pub.dev/documentation/darq/latest/darq/Enumerable/Take.html)
 - [TakeWhile](https://pub.dev/documentation/darq/latest/darq/Enumerable/TakeWhile.html)
 - [ThenBy](https://pub.dev/documentation/darq/latest/darq/Enumerable/ThenBy.html)
 - [ThenByDescending](https://pub.dev/documentation/darq/latest/darq/Enumerable/ThenByDescending.html)
 - [ToList](https://pub.dev/documentation/darq/latest/darq/Enumerable/ToList.html)
 - [ToMap](https://pub.dev/documentation/darq/latest/darq/Enumerable/ToMap.html)
 - [ToSet](https://pub.dev/documentation/darq/latest/darq/Enumerable/ToSet.html)
 - [Union](https://pub.dev/documentation/darq/latest/darq/Enumerable/Union.html)
 - [Where](https://pub.dev/documentation/darq/latest/darq/Enumerable/Where.html)
 - [Zip](https://pub.dev/documentation/darq/latest/darq/Enumerable/Zip.html)