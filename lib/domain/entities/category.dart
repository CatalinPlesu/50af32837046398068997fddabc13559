import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String iconUrl;

  const Category({
    required this.name,
    required this.iconUrl,
  });

  @override
  List<Object> get props => [name, iconUrl];
}

