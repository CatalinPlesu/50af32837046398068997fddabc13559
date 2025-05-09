import 'package:drift/drift.dart';

@DataClassName('CategoryTable')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer().unique()();
  TextColumn get name => text()();
  TextColumn get iconUrl => text()();
  DateTimeColumn get lastUpdated => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ProductTable')
class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer().unique()();
  TextColumn get name => text()();
  TextColumn get details => text()();
  TextColumn get size => text()();
  TextColumn get color => text()();
  RealColumn get price => real()();
  TextColumn get mainImageUrl => text()();
  IntColumn get categoryId => integer().references(Categories, #categoryId)();
  IntColumn get soldCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastUpdated => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ProductImageTable')
class ProductImages extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer().references(Products, #productId)();
  TextColumn get imageUrl => text()();
  DateTimeColumn get lastUpdated => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ReviewTable')
class Reviews extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get reviewId => integer().unique()();
  IntColumn get productId => integer().references(Products, #productId)();
  IntColumn get userId => integer()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get userImage => text()();
  RealColumn get rating => real()();
  TextColumn get comment => text()();
  TextColumn get message => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get modifiedAt => dateTime()();
  DateTimeColumn get lastUpdated => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
