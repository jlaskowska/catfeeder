import 'dart:convert';

import 'package:catfeeder/modules/backend/backend.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('correct json', () {
    final jsonString = '''{
  "id": "id",
  "cats": ["cat1", "cat2"]
} ''';

    final jsonMap = json.decode(jsonString);
    final user = User.fromJson(jsonMap);
    expect(user, isNotNull);
    expect(user.id, 'id');
    expect(user.cats, ['cat1', 'cat2']);
  });

  test('empty json', () {
    final jsonMap = json.decode('{}');
    final user = User.fromJson(jsonMap);
    expect(user, isNotNull);
    expect(user.id, isNull);
    expect(user.cats, isNull);
  });
}
