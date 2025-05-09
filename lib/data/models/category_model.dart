import 'package:ebs_application/domain/entities/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int id;
  final String name;
  @JsonKey(name: 'icon')
  final String iconUrl;

  CategoryModel({required this.id, required this.name, required this.iconUrl});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  Category toEntity() {
    return Category(id: id, name: name, iconUrl: iconUrl);
  }

  factory CategoryModel.fromEntity(Category category) {
    return CategoryModel(
      id: category.id,
      name: category.name,
      iconUrl: category.iconUrl,
    );
  }
}
