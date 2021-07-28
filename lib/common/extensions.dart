import 'dart:convert';
import 'package:flutter/foundation.dart';

extension IterableX on Iterable {
  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    } else {
      return isEmpty;
    }
  }

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

extension MapX<K, V> on Map<K, V> {
  T get<T>(K key) => this[key] as T;

  String jsonEncode() => json.encode(this);
}



extension StringX on String {
  bool containsIgnoreCase(String stringToMatch) {
    return toLowerCase().contains(stringToMatch.toLowerCase());
  }

  bool hasValidData() {
    return this != null && trim().isNotEmpty;
  }



  String getSafeData() {
    return hasValidData() ? this : '';
  }

  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    } else if (this is String && this == 'null') {
      return true;
    } else {
      return isEmpty;
    }
  }

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  Iterable<String> toIterable() sync* {
    for (var i = 0; i < length; i++) {
      yield (this[i]);
    }
  }

  /// Same as contains, but allows for case insensitive searching
  ///
  /// [caseInsensitive] defaults to false
  bool containsX(String string, {bool caseInsensitive = false}) {
    if (caseInsensitive) {
      // match even if case doesn't match
      return toLowerCase().contains(string.toLowerCase());
    } else {
      return contains(string);
    }
  }


  String substringUntil(Pattern occurrence) {
    final index = indexOf(occurrence);
    if (index == -1) {
      return this;
    }
    return substring(0, index);
  }

  String toLowerCaseNoSpaces() => toLowerCase().replaceAll(' ', '');
}

extension ListEmptyValidation<E> on Iterable<E> {
  bool hasData() => this != null && isNotEmpty;
}

extension EmptyAndNullStringValidation on String {
  bool isNotNullAndNotEmpty() {
    return !(['', null].contains(this));
  }
}

extension NullValidation on dynamic {
  bool isNotNull() {
    return this != null;
  }
}







/// Date Time Util
extension DateUtil on String {
  DateTime convertDate() {
    return DateTime.parse(this);
  }
}


extension IntUtils on int {
  bool hasValidData() {
    return (this != null);
  }
}

extension ListX<E> on List<E> {
  bool equals(List<E> other) {
    return listEquals<E>(this, other);
  }

  bool containsWhere(bool test(E element)) {
    for (final e in this) {
      if (test(e)) return true;
    }
    return false;
  }

  E firstOrElse(E Function() orElse) {
    if (isNotEmpty) {
      return first;
    } else {
      return orElse();
    }
  }
}
