import 'package:ebs_application/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required String name,
    required String iconUrl,
  }) : super(name: name, iconUrl: iconUrl);

  factory CategoryModel.fromJson(Map<String, dynamic> json ){
    return CategoryModel(name: json["name"], iconUrl: json["icon"]);
  }
}