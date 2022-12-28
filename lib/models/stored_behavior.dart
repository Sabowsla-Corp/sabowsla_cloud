import 'dart:core';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/injection.dart';

class StoredBehavior {
  final BehaviorSubject behaviorSubject;
  final String behaviorKey;

  StoredBehavior({
    required this.behaviorSubject,
    required this.behaviorKey,
  }) {
    loadValue();
  }

  Future<void> updateValue(dynamic newValue) async {
    var prefs = locator<SharedPreferences>();
    if (behaviorSubject is BehaviorSubject<int> && newValue is int) {
      bool saved = await prefs.setInt(behaviorKey, newValue);
      if (saved) {
        behaviorSubject.add(newValue);
      }
    }
    if (behaviorSubject is BehaviorSubject<List<String>> &&
        newValue is List<String>) {
      bool saved = await prefs.setStringList(behaviorKey, newValue);
      if (saved) {
        behaviorSubject.add(newValue);
      }
    }
  }

  Future<void> loadValue() async {
    var prefs = locator<SharedPreferences>();
    if (behaviorSubject is BehaviorSubject<int>) {
      int? savedValue = prefs.getInt(behaviorKey);
      if (savedValue is int) {
        behaviorSubject.add(savedValue);
      }
    }
  }

  static StoredBehavior singleInt(String key) {
    return StoredBehavior(
      behaviorSubject: BehaviorSubject<int>.seeded(0),
      behaviorKey: key,
    );
  }

  static StoredBehavior stringList(String key) {
    return StoredBehavior(
      behaviorSubject: BehaviorSubject<List<String>>.seeded([]),
      behaviorKey: key,
    );
  }
}
