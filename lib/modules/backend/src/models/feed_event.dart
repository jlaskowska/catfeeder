import 'package:meta/meta.dart';

class FeedEvent {
  final DateTime time;
  final num amount;
  final String userId;
  final String id;
  final String catId;

  FeedEvent({
    @required this.id,
    @required this.amount,
    @required this.catId,
    @required this.time,
    @required this.userId,
  });

  factory FeedEvent.fromJson(Map<String, dynamic> json) => FeedEvent(
        id: json['id'],
        amount: json['amount'],
        catId: json['cat_id'],
        userId: json['user_id'],
        time: json['timestamp'] != null ? DateTime.fromMillisecondsSinceEpoch(json['timestamp']).toLocal() : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'cat_id': catId,
        'user_id': userId,
        'time': time?.toUtc()?.millisecondsSinceEpoch,
      };
}
