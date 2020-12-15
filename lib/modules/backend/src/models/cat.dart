import 'package:meta/meta.dart';

class Cat {
  final String id;
  final String name;
  final String imageUrl;

  Cat({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
  });

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json['id'],
        name: json['name'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
      };

  @override
  String toString() => toJson().toString();
}
