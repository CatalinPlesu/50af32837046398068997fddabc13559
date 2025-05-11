import 'package:drift/drift.dart';

@DataClassName('CategoryTable')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer().unique()();
  TextColumn get name => text()();
  TextColumn get icon => text()();
}

@DataClassName('ProductTable')
class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer().unique()();
  IntColumn get categoryId => integer().references(Categories, #categoryId)();
  TextColumn get name => text()();
  TextColumn get details => text()();
  TextColumn get size => text()();
  TextColumn get colour => text()();
  RealColumn get price => real()();
  TextColumn get mainImage => text()();
  IntColumn get soldCount => integer().withDefault(const Constant(0))();
}

@DataClassName('ProductImageTable')
class ProductImages extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer().references(Products, #productId)();
  TextColumn get image => text()();
}

@DataClassName('ReviewTable')
class Reviews extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get reviewId => integer().unique()();
  IntColumn get productId => integer().references(Products, #productId)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get modifiedAt => dateTime()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get image => text()();
  RealColumn get rating => real()();
  TextColumn get message => text()();

}
