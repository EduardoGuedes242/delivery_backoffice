import 'dart:html';
import './storage.dart';

class StorageImpl implements Storage {
  @override
  @override
  String getData(String key) => window.sessionStorage[key] ?? '';

  @override
  void setData(String key, String value) => window.sessionStorage[key] = value;

  void clean() => window.sessionStorage.clear();
}
