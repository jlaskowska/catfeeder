import 'package:meta/meta.dart';

class User {
  final String id;
  final List<String> cats;

  User({@required this.id, @required this.cats});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        cats: json['cats'] != null ? List<String>.from(json['cats']) : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'cats': cats,
      };
}
