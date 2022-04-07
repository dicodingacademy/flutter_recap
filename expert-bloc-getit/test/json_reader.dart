import 'dart:io';

String readJson(String name) {
  final data = File('test/$name').readAsStringSync();
  return data;
}
