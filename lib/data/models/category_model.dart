import 'package:ebs_application/domain/entities/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int? id;
  final String name;
  final String icon;

  CategoryModel({required this.id, required this.name, required this.icon});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  Category toEntity() {
    return Category(id: id, name: name, icon: icon);
  }

  factory CategoryModel.fromEntity(Category category) {
    return CategoryModel(
      id: category.id,
      name: category.name,
      icon: category.icon,
    );
  }
}

@JsonSerializable()
class CategoryResponseModel {
  final List<CategoryModel> results;

  CategoryResponseModel({required this.results});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseModelToJson(this);
}