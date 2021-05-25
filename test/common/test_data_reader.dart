import 'dart:convert';
import 'dart:io';

List<T> readTestData<T>(String fileName, T map(dynamic e),
    {String extension = ".json"}) {
  final file = File("test_data/$fileName$extension");
  final decoded = jsonDecode(file.readAsStringSync()) as List<dynamic>;
  return decoded.map(map).toList();
}
