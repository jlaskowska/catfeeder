import 'package:catfeeder/modules/backend/backend.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

void main() {
  test('correct json', () {
    final jsonString = '''
{
  "id":"id",
  "user_id":"userId",
  "cat_id": "catId",
  "amount":20,
  "timestamp": 1605539997357
}
''';
    final jsonMap = json.decode(jsonString);
    final feedEvent = FeedEvent.fromJson(jsonMap);
    expect(feedEvent, isNotNull);
    expect(feedEvent.id, 'id');
    expect(feedEvent.catId, 'catId');
    expect(feedEvent.userId, 'userId');
    expect(feedEvent.amount, 20);
    expect(feedEvent.time, DateTime.fromMillisecondsSinceEpoch(1605539997357).toLocal());
  });

  test('empty json', () {
    final jsonMap = json.decode('{}');
    final feedEvent = FeedEvent.fromJson(jsonMap);
    expect(feedEvent, isNotNull);
    expect(feedEvent.id, isNull);
    expect(feedEvent.catId, isNull);
    expect(feedEvent.userId, isNull);
    expect(feedEvent.amount, isNull);
    expect(feedEvent.time, isNull);
  });
}
