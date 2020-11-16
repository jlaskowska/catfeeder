import 'package:meta/meta.dart';

class Cat {
  final String id;
  final String name;

  Cat({
    @required this.id,
    @required this.name,
  });

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
