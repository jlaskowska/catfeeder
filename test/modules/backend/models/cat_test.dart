import 'dart:convert';

import 'package:catfeeder/modules/backend/backend.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('correct json', () {
    final jsonString = '''
{
  "id":"id",
  "name":"Puszek",
  "imageUrl":"url"
}
''';
    final jsonMap = json.decode(jsonString);
    final cat = Cat.fromJson(jsonMap);
    expect(cat, isNotNull);
    expect(cat.id, 'id');
    expect(cat.name, 'Puszek');
    expect(cat.imageUrl, 'url');
  });

  test('empty json', () {
    final jsonMap = json.decode('{}');
    final cat = Cat.fromJson(jsonMap);
    expect(cat, isNotNull);
    expect(cat.id, isNull);
    expect(cat.name, isNull);
    expect(cat.imageUrl, isNull);
  });
}
