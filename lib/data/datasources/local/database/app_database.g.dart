// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, categoryId, name, icon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryTable(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      categoryId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}category_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      icon:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}icon'],
          )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class CategoryTable extends DataClass implements Insertable<CategoryTable> {
  final int id;
  final int categoryId;
  final String name;
  final String icon;
  const CategoryTable({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.icon,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<String>(icon);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      name: Value(name),
      icon: Value(icon),
    );
  }

  factory CategoryTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryTable(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<String>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<String>(icon),
    };
  }

  CategoryTable copyWith({
    int? id,
    int? categoryId,
    String? name,
    String? icon,
  }) => CategoryTable(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
    name: name ?? this.name,
    icon: icon ?? this.icon,
  );
  CategoryTable copyWithCompanion(CategoriesCompanion data) {
    return CategoryTable(
      id: data.id.present ? data.id.value : this.id,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTable(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryId, name, icon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTable &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.name == this.name &&
          other.icon == this.icon);
}

class CategoriesCompanion extends UpdateCompanion<CategoryTable> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<String> name;
  final Value<String> icon;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required String name,
    required String icon,
  }) : categoryId = Value(categoryId),
       name = Value(name),
       icon = Value(icon);
  static Insertable<CategoryTable> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<String>? name,
    Expression<String>? icon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
    });
  }

  CategoriesCompanion copyWith({
    Value<int>? id,
    Value<int>? categoryId,
    Value<String>? name,
    Value<String>? icon,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products
    with TableInfo<$ProductsTable, ProductTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (category_id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailsMeta = const VerificationMeta(
    'details',
  );
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
    'details',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String> size = GeneratedColumn<String>(
    'size',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colourMeta = const VerificationMeta('colour');
  @override
  late final GeneratedColumn<String> colour = GeneratedColumn<String>(
    'colour',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mainImageMeta = const VerificationMeta(
    'mainImage',
  );
  @override
  late final GeneratedColumn<String> mainImage = GeneratedColumn<String>(
    'main_image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _soldCountMeta = const VerificationMeta(
    'soldCount',
  );
  @override
  late final GeneratedColumn<int> soldCount = GeneratedColumn<int>(
    'sold_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    productId,
    categoryId,
    name,
    details,
    size,
    colour,
    price,
    mainImage,
    soldCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('details')) {
      context.handle(
        _detailsMeta,
        details.isAcceptableOrUnknown(data['details']!, _detailsMeta),
      );
    } else if (isInserting) {
      context.missing(_detailsMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('colour')) {
      context.handle(
        _colourMeta,
        colour.isAcceptableOrUnknown(data['colour']!, _colourMeta),
      );
    } else if (isInserting) {
      context.missing(_colourMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('main_image')) {
      context.handle(
        _mainImageMeta,
        mainImage.isAcceptableOrUnknown(data['main_image']!, _mainImageMeta),
      );
    } else if (isInserting) {
      context.missing(_mainImageMeta);
    }
    if (data.containsKey('sold_count')) {
      context.handle(
        _soldCountMeta,
        soldCount.isAcceptableOrUnknown(data['sold_count']!, _soldCountMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductTable(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      productId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}product_id'],
          )!,
      categoryId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}category_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      details:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}details'],
          )!,
      size:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}size'],
          )!,
      colour:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}colour'],
          )!,
      price:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}price'],
          )!,
      mainImage:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}main_image'],
          )!,
      soldCount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sold_count'],
          )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class ProductTable extends DataClass implements Insertable<ProductTable> {
  final int id;
  final int productId;
  final int categoryId;
  final String name;
  final String details;
  final String size;
  final String colour;
  final double price;
  final String mainImage;
  final int soldCount;
  const ProductTable({
    required this.id,
    required this.productId,
    required this.categoryId,
    required this.name,
    required this.details,
    required this.size,
    required this.colour,
    required this.price,
    required this.mainImage,
    required this.soldCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['category_id'] = Variable<int>(categoryId);
    map['name'] = Variable<String>(name);
    map['details'] = Variable<String>(details);
    map['size'] = Variable<String>(size);
    map['colour'] = Variable<String>(colour);
    map['price'] = Variable<double>(price);
    map['main_image'] = Variable<String>(mainImage);
    map['sold_count'] = Variable<int>(soldCount);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      productId: Value(productId),
      categoryId: Value(categoryId),
      name: Value(name),
      details: Value(details),
      size: Value(size),
      colour: Value(colour),
      price: Value(price),
      mainImage: Value(mainImage),
      soldCount: Value(soldCount),
    );
  }

  factory ProductTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductTable(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      name: serializer.fromJson<String>(json['name']),
      details: serializer.fromJson<String>(json['details']),
      size: serializer.fromJson<String>(json['size']),
      colour: serializer.fromJson<String>(json['colour']),
      price: serializer.fromJson<double>(json['price']),
      mainImage: serializer.fromJson<String>(json['mainImage']),
      soldCount: serializer.fromJson<int>(json['soldCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'categoryId': serializer.toJson<int>(categoryId),
      'name': serializer.toJson<String>(name),
      'details': serializer.toJson<String>(details),
      'size': serializer.toJson<String>(size),
      'colour': serializer.toJson<String>(colour),
      'price': serializer.toJson<double>(price),
      'mainImage': serializer.toJson<String>(mainImage),
      'soldCount': serializer.toJson<int>(soldCount),
    };
  }

  ProductTable copyWith({
    int? id,
    int? productId,
    int? categoryId,
    String? name,
    String? details,
    String? size,
    String? colour,
    double? price,
    String? mainImage,
    int? soldCount,
  }) => ProductTable(
    id: id ?? this.id,
    productId: productId ?? this.productId,
    categoryId: categoryId ?? this.categoryId,
    name: name ?? this.name,
    details: details ?? this.details,
    size: size ?? this.size,
    colour: colour ?? this.colour,
    price: price ?? this.price,
    mainImage: mainImage ?? this.mainImage,
    soldCount: soldCount ?? this.soldCount,
  );
  ProductTable copyWithCompanion(ProductsCompanion data) {
    return ProductTable(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      name: data.name.present ? data.name.value : this.name,
      details: data.details.present ? data.details.value : this.details,
      size: data.size.present ? data.size.value : this.size,
      colour: data.colour.present ? data.colour.value : this.colour,
      price: data.price.present ? data.price.value : this.price,
      mainImage: data.mainImage.present ? data.mainImage.value : this.mainImage,
      soldCount: data.soldCount.present ? data.soldCount.value : this.soldCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductTable(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('details: $details, ')
          ..write('size: $size, ')
          ..write('colour: $colour, ')
          ..write('price: $price, ')
          ..write('mainImage: $mainImage, ')
          ..write('soldCount: $soldCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    productId,
    categoryId,
    name,
    details,
    size,
    colour,
    price,
    mainImage,
    soldCount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductTable &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.categoryId == this.categoryId &&
          other.name == this.name &&
          other.details == this.details &&
          other.size == this.size &&
          other.colour == this.colour &&
          other.price == this.price &&
          other.mainImage == this.mainImage &&
          other.soldCount == this.soldCount);
}

class ProductsCompanion extends UpdateCompanion<ProductTable> {
  final Value<int> id;
  final Value<int> productId;
  final Value<int> categoryId;
  final Value<String> name;
  final Value<String> details;
  final Value<String> size;
  final Value<String> colour;
  final Value<double> price;
  final Value<String> mainImage;
  final Value<int> soldCount;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.name = const Value.absent(),
    this.details = const Value.absent(),
    this.size = const Value.absent(),
    this.colour = const Value.absent(),
    this.price = const Value.absent(),
    this.mainImage = const Value.absent(),
    this.soldCount = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required int categoryId,
    required String name,
    required String details,
    required String size,
    required String colour,
    required double price,
    required String mainImage,
    this.soldCount = const Value.absent(),
  }) : productId = Value(productId),
       categoryId = Value(categoryId),
       name = Value(name),
       details = Value(details),
       size = Value(size),
       colour = Value(colour),
       price = Value(price),
       mainImage = Value(mainImage);
  static Insertable<ProductTable> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<int>? categoryId,
    Expression<String>? name,
    Expression<String>? details,
    Expression<String>? size,
    Expression<String>? colour,
    Expression<double>? price,
    Expression<String>? mainImage,
    Expression<int>? soldCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (categoryId != null) 'category_id': categoryId,
      if (name != null) 'name': name,
      if (details != null) 'details': details,
      if (size != null) 'size': size,
      if (colour != null) 'colour': colour,
      if (price != null) 'price': price,
      if (mainImage != null) 'main_image': mainImage,
      if (soldCount != null) 'sold_count': soldCount,
    });
  }

  ProductsCompanion copyWith({
    Value<int>? id,
    Value<int>? productId,
    Value<int>? categoryId,
    Value<String>? name,
    Value<String>? details,
    Value<String>? size,
    Value<String>? colour,
    Value<double>? price,
    Value<String>? mainImage,
    Value<int>? soldCount,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      details: details ?? this.details,
      size: size ?? this.size,
      colour: colour ?? this.colour,
      price: price ?? this.price,
      mainImage: mainImage ?? this.mainImage,
      soldCount: soldCount ?? this.soldCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (colour.present) {
      map['colour'] = Variable<String>(colour.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (mainImage.present) {
      map['main_image'] = Variable<String>(mainImage.value);
    }
    if (soldCount.present) {
      map['sold_count'] = Variable<int>(soldCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('details: $details, ')
          ..write('size: $size, ')
          ..write('colour: $colour, ')
          ..write('price: $price, ')
          ..write('mainImage: $mainImage, ')
          ..write('soldCount: $soldCount')
          ..write(')'))
        .toString();
  }
}

class $ReviewsTable extends Reviews with TableInfo<$ReviewsTable, ReviewTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _reviewIdMeta = const VerificationMeta(
    'reviewId',
  );
  @override
  late final GeneratedColumn<int> reviewId = GeneratedColumn<int>(
    'review_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (product_id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modifiedAtMeta = const VerificationMeta(
    'modifiedAt',
  );
  @override
  late final GeneratedColumn<DateTime> modifiedAt = GeneratedColumn<DateTime>(
    'modified_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    reviewId,
    productId,
    createdAt,
    modifiedAt,
    firstName,
    lastName,
    image,
    rating,
    message,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reviews';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReviewTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('review_id')) {
      context.handle(
        _reviewIdMeta,
        reviewId.isAcceptableOrUnknown(data['review_id']!, _reviewIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reviewIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('modified_at')) {
      context.handle(
        _modifiedAtMeta,
        modifiedAt.isAcceptableOrUnknown(data['modified_at']!, _modifiedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_modifiedAtMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReviewTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReviewTable(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      reviewId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}review_id'],
          )!,
      productId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}product_id'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      modifiedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}modified_at'],
          )!,
      firstName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}first_name'],
          )!,
      lastName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}last_name'],
          )!,
      image:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image'],
          )!,
      rating:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}rating'],
          )!,
      message:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}message'],
          )!,
    );
  }

  @override
  $ReviewsTable createAlias(String alias) {
    return $ReviewsTable(attachedDatabase, alias);
  }
}

class ReviewTable extends DataClass implements Insertable<ReviewTable> {
  final int id;
  final int reviewId;
  final int productId;
  final DateTime createdAt;
  final DateTime modifiedAt;
  final String firstName;
  final String lastName;
  final String image;
  final double rating;
  final String message;
  const ReviewTable({
    required this.id,
    required this.reviewId,
    required this.productId,
    required this.createdAt,
    required this.modifiedAt,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.rating,
    required this.message,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['review_id'] = Variable<int>(reviewId);
    map['product_id'] = Variable<int>(productId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['modified_at'] = Variable<DateTime>(modifiedAt);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['image'] = Variable<String>(image);
    map['rating'] = Variable<double>(rating);
    map['message'] = Variable<String>(message);
    return map;
  }

  ReviewsCompanion toCompanion(bool nullToAbsent) {
    return ReviewsCompanion(
      id: Value(id),
      reviewId: Value(reviewId),
      productId: Value(productId),
      createdAt: Value(createdAt),
      modifiedAt: Value(modifiedAt),
      firstName: Value(firstName),
      lastName: Value(lastName),
      image: Value(image),
      rating: Value(rating),
      message: Value(message),
    );
  }

  factory ReviewTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReviewTable(
      id: serializer.fromJson<int>(json['id']),
      reviewId: serializer.fromJson<int>(json['reviewId']),
      productId: serializer.fromJson<int>(json['productId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      modifiedAt: serializer.fromJson<DateTime>(json['modifiedAt']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      image: serializer.fromJson<String>(json['image']),
      rating: serializer.fromJson<double>(json['rating']),
      message: serializer.fromJson<String>(json['message']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reviewId': serializer.toJson<int>(reviewId),
      'productId': serializer.toJson<int>(productId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'modifiedAt': serializer.toJson<DateTime>(modifiedAt),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'image': serializer.toJson<String>(image),
      'rating': serializer.toJson<double>(rating),
      'message': serializer.toJson<String>(message),
    };
  }

  ReviewTable copyWith({
    int? id,
    int? reviewId,
    int? productId,
    DateTime? createdAt,
    DateTime? modifiedAt,
    String? firstName,
    String? lastName,
    String? image,
    double? rating,
    String? message,
  }) => ReviewTable(
    id: id ?? this.id,
    reviewId: reviewId ?? this.reviewId,
    productId: productId ?? this.productId,
    createdAt: createdAt ?? this.createdAt,
    modifiedAt: modifiedAt ?? this.modifiedAt,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    image: image ?? this.image,
    rating: rating ?? this.rating,
    message: message ?? this.message,
  );
  ReviewTable copyWithCompanion(ReviewsCompanion data) {
    return ReviewTable(
      id: data.id.present ? data.id.value : this.id,
      reviewId: data.reviewId.present ? data.reviewId.value : this.reviewId,
      productId: data.productId.present ? data.productId.value : this.productId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      modifiedAt:
          data.modifiedAt.present ? data.modifiedAt.value : this.modifiedAt,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      image: data.image.present ? data.image.value : this.image,
      rating: data.rating.present ? data.rating.value : this.rating,
      message: data.message.present ? data.message.value : this.message,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReviewTable(')
          ..write('id: $id, ')
          ..write('reviewId: $reviewId, ')
          ..write('productId: $productId, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('image: $image, ')
          ..write('rating: $rating, ')
          ..write('message: $message')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    reviewId,
    productId,
    createdAt,
    modifiedAt,
    firstName,
    lastName,
    image,
    rating,
    message,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReviewTable &&
          other.id == this.id &&
          other.reviewId == this.reviewId &&
          other.productId == this.productId &&
          other.createdAt == this.createdAt &&
          other.modifiedAt == this.modifiedAt &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.image == this.image &&
          other.rating == this.rating &&
          other.message == this.message);
}

class ReviewsCompanion extends UpdateCompanion<ReviewTable> {
  final Value<int> id;
  final Value<int> reviewId;
  final Value<int> productId;
  final Value<DateTime> createdAt;
  final Value<DateTime> modifiedAt;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> image;
  final Value<double> rating;
  final Value<String> message;
  const ReviewsCompanion({
    this.id = const Value.absent(),
    this.reviewId = const Value.absent(),
    this.productId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.image = const Value.absent(),
    this.rating = const Value.absent(),
    this.message = const Value.absent(),
  });
  ReviewsCompanion.insert({
    this.id = const Value.absent(),
    required int reviewId,
    required int productId,
    required DateTime createdAt,
    required DateTime modifiedAt,
    required String firstName,
    required String lastName,
    required String image,
    required double rating,
    required String message,
  }) : reviewId = Value(reviewId),
       productId = Value(productId),
       createdAt = Value(createdAt),
       modifiedAt = Value(modifiedAt),
       firstName = Value(firstName),
       lastName = Value(lastName),
       image = Value(image),
       rating = Value(rating),
       message = Value(message);
  static Insertable<ReviewTable> custom({
    Expression<int>? id,
    Expression<int>? reviewId,
    Expression<int>? productId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? modifiedAt,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? image,
    Expression<double>? rating,
    Expression<String>? message,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reviewId != null) 'review_id': reviewId,
      if (productId != null) 'product_id': productId,
      if (createdAt != null) 'created_at': createdAt,
      if (modifiedAt != null) 'modified_at': modifiedAt,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (image != null) 'image': image,
      if (rating != null) 'rating': rating,
      if (message != null) 'message': message,
    });
  }

  ReviewsCompanion copyWith({
    Value<int>? id,
    Value<int>? reviewId,
    Value<int>? productId,
    Value<DateTime>? createdAt,
    Value<DateTime>? modifiedAt,
    Value<String>? firstName,
    Value<String>? lastName,
    Value<String>? image,
    Value<double>? rating,
    Value<String>? message,
  }) {
    return ReviewsCompanion(
      id: id ?? this.id,
      reviewId: reviewId ?? this.reviewId,
      productId: productId ?? this.productId,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      message: message ?? this.message,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reviewId.present) {
      map['review_id'] = Variable<int>(reviewId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (modifiedAt.present) {
      map['modified_at'] = Variable<DateTime>(modifiedAt.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewsCompanion(')
          ..write('id: $id, ')
          ..write('reviewId: $reviewId, ')
          ..write('productId: $productId, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('image: $image, ')
          ..write('rating: $rating, ')
          ..write('message: $message')
          ..write(')'))
        .toString();
  }
}

class $ProductImagesTable extends ProductImages
    with TableInfo<$ProductImagesTable, ProductImageTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (product_id)',
    ),
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, productId, image];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_images';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductImageTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductImageTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductImageTable(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      productId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}product_id'],
          )!,
      image:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image'],
          )!,
    );
  }

  @override
  $ProductImagesTable createAlias(String alias) {
    return $ProductImagesTable(attachedDatabase, alias);
  }
}

class ProductImageTable extends DataClass
    implements Insertable<ProductImageTable> {
  final int id;
  final int productId;
  final String image;
  const ProductImageTable({
    required this.id,
    required this.productId,
    required this.image,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['image'] = Variable<String>(image);
    return map;
  }

  ProductImagesCompanion toCompanion(bool nullToAbsent) {
    return ProductImagesCompanion(
      id: Value(id),
      productId: Value(productId),
      image: Value(image),
    );
  }

  factory ProductImageTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductImageTable(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'image': serializer.toJson<String>(image),
    };
  }

  ProductImageTable copyWith({int? id, int? productId, String? image}) =>
      ProductImageTable(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        image: image ?? this.image,
      );
  ProductImageTable copyWithCompanion(ProductImagesCompanion data) {
    return ProductImageTable(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductImageTable(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductImageTable &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.image == this.image);
}

class ProductImagesCompanion extends UpdateCompanion<ProductImageTable> {
  final Value<int> id;
  final Value<int> productId;
  final Value<String> image;
  const ProductImagesCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.image = const Value.absent(),
  });
  ProductImagesCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required String image,
  }) : productId = Value(productId),
       image = Value(image);
  static Insertable<ProductImageTable> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (image != null) 'image': image,
    });
  }

  ProductImagesCompanion copyWith({
    Value<int>? id,
    Value<int>? productId,
    Value<String>? image,
  }) {
    return ProductImagesCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductImagesCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $ReviewsTable reviews = $ReviewsTable(this);
  late final $ProductImagesTable productImages = $ProductImagesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categories,
    products,
    reviews,
    productImages,
  ];
}

typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      required int categoryId,
      required String name,
      required String icon,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<int> id,
      Value<int> categoryId,
      Value<String> name,
      Value<String> icon,
    });

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, CategoryTable> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductsTable, List<ProductTable>>
  _productsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.products,
    aliasName: $_aliasNameGenerator(
      db.categories.categoryId,
      db.products.categoryId,
    ),
  );

  $$ProductsTableProcessedTableManager get productsRefs {
    final manager = $$ProductsTableTableManager($_db, $_db.products).filter(
      (f) =>
          f.categoryId.categoryId.sqlEquals($_itemColumn<int>('category_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_productsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productsRefs(
    Expression<bool> Function($$ProductsTableFilterComposer f) f,
  ) {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  Expression<T> productsRefs<T extends Object>(
    Expression<T> Function($$ProductsTableAnnotationComposer a) f,
  ) {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          CategoryTable,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (CategoryTable, $$CategoriesTableReferences),
          CategoryTable,
          PrefetchHooks Function({bool productsRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> icon = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                categoryId: categoryId,
                name: name,
                icon: icon,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int categoryId,
                required String name,
                required String icon,
              }) => CategoriesCompanion.insert(
                id: id,
                categoryId: categoryId,
                name: name,
                icon: icon,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CategoriesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({productsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productsRefs) db.products],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productsRefs)
                    await $_getPrefetchedData<
                      CategoryTable,
                      $CategoriesTable,
                      ProductTable
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriesTableReferences
                          ._productsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).productsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.categoryId == item.categoryId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      CategoryTable,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (CategoryTable, $$CategoriesTableReferences),
      CategoryTable,
      PrefetchHooks Function({bool productsRefs})
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      required int productId,
      required int categoryId,
      required String name,
      required String details,
      required String size,
      required String colour,
      required double price,
      required String mainImage,
      Value<int> soldCount,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<int> productId,
      Value<int> categoryId,
      Value<String> name,
      Value<String> details,
      Value<String> size,
      Value<String> colour,
      Value<double> price,
      Value<String> mainImage,
      Value<int> soldCount,
    });

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, ProductTable> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias(
        $_aliasNameGenerator(db.products.categoryId, db.categories.categoryId),
      );

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.categoryId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ReviewsTable, List<ReviewTable>>
  _reviewsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reviews,
    aliasName: $_aliasNameGenerator(
      db.products.productId,
      db.reviews.productId,
    ),
  );

  $$ReviewsTableProcessedTableManager get reviewsRefs {
    final manager = $$ReviewsTableTableManager($_db, $_db.reviews).filter(
      (f) => f.productId.productId.sqlEquals($_itemColumn<int>('product_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_reviewsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProductImagesTable, List<ProductImageTable>>
  _productImagesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.productImages,
    aliasName: $_aliasNameGenerator(
      db.products.productId,
      db.productImages.productId,
    ),
  );

  $$ProductImagesTableProcessedTableManager get productImagesRefs {
    final manager = $$ProductImagesTableTableManager(
      $_db,
      $_db.productImages,
    ).filter(
      (f) => f.productId.productId.sqlEquals($_itemColumn<int>('product_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_productImagesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colour => $composableBuilder(
    column: $table.colour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mainImage => $composableBuilder(
    column: $table.mainImage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get soldCount => $composableBuilder(
    column: $table.soldCount,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> reviewsRefs(
    Expression<bool> Function($$ReviewsTableFilterComposer f) f,
  ) {
    final $$ReviewsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.reviews,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewsTableFilterComposer(
            $db: $db,
            $table: $db.reviews,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> productImagesRefs(
    Expression<bool> Function($$ProductImagesTableFilterComposer f) f,
  ) {
    final $$ProductImagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.productImages,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductImagesTableFilterComposer(
            $db: $db,
            $table: $db.productImages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colour => $composableBuilder(
    column: $table.colour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mainImage => $composableBuilder(
    column: $table.mainImage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get soldCount => $composableBuilder(
    column: $table.soldCount,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  GeneratedColumn<String> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<String> get colour =>
      $composableBuilder(column: $table.colour, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get mainImage =>
      $composableBuilder(column: $table.mainImage, builder: (column) => column);

  GeneratedColumn<int> get soldCount =>
      $composableBuilder(column: $table.soldCount, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> reviewsRefs<T extends Object>(
    Expression<T> Function($$ReviewsTableAnnotationComposer a) f,
  ) {
    final $$ReviewsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.reviews,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewsTableAnnotationComposer(
            $db: $db,
            $table: $db.reviews,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> productImagesRefs<T extends Object>(
    Expression<T> Function($$ProductImagesTableAnnotationComposer a) f,
  ) {
    final $$ProductImagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.productImages,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductImagesTableAnnotationComposer(
            $db: $db,
            $table: $db.productImages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          ProductTable,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (ProductTable, $$ProductsTableReferences),
          ProductTable,
          PrefetchHooks Function({
            bool categoryId,
            bool reviewsRefs,
            bool productImagesRefs,
          })
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> details = const Value.absent(),
                Value<String> size = const Value.absent(),
                Value<String> colour = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<String> mainImage = const Value.absent(),
                Value<int> soldCount = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                productId: productId,
                categoryId: categoryId,
                name: name,
                details: details,
                size: size,
                colour: colour,
                price: price,
                mainImage: mainImage,
                soldCount: soldCount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int productId,
                required int categoryId,
                required String name,
                required String details,
                required String size,
                required String colour,
                required double price,
                required String mainImage,
                Value<int> soldCount = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                productId: productId,
                categoryId: categoryId,
                name: name,
                details: details,
                size: size,
                colour: colour,
                price: price,
                mainImage: mainImage,
                soldCount: soldCount,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ProductsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            categoryId = false,
            reviewsRefs = false,
            productImagesRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (reviewsRefs) db.reviews,
                if (productImagesRefs) db.productImages,
              ],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (categoryId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.categoryId,
                            referencedTable: $$ProductsTableReferences
                                ._categoryIdTable(db),
                            referencedColumn:
                                $$ProductsTableReferences
                                    ._categoryIdTable(db)
                                    .categoryId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reviewsRefs)
                    await $_getPrefetchedData<
                      ProductTable,
                      $ProductsTable,
                      ReviewTable
                    >(
                      currentTable: table,
                      referencedTable: $$ProductsTableReferences
                          ._reviewsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).reviewsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.productId == item.productId,
                          ),
                      typedResults: items,
                    ),
                  if (productImagesRefs)
                    await $_getPrefetchedData<
                      ProductTable,
                      $ProductsTable,
                      ProductImageTable
                    >(
                      currentTable: table,
                      referencedTable: $$ProductsTableReferences
                          ._productImagesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).productImagesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.productId == item.productId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      ProductTable,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (ProductTable, $$ProductsTableReferences),
      ProductTable,
      PrefetchHooks Function({
        bool categoryId,
        bool reviewsRefs,
        bool productImagesRefs,
      })
    >;
typedef $$ReviewsTableCreateCompanionBuilder =
    ReviewsCompanion Function({
      Value<int> id,
      required int reviewId,
      required int productId,
      required DateTime createdAt,
      required DateTime modifiedAt,
      required String firstName,
      required String lastName,
      required String image,
      required double rating,
      required String message,
    });
typedef $$ReviewsTableUpdateCompanionBuilder =
    ReviewsCompanion Function({
      Value<int> id,
      Value<int> reviewId,
      Value<int> productId,
      Value<DateTime> createdAt,
      Value<DateTime> modifiedAt,
      Value<String> firstName,
      Value<String> lastName,
      Value<String> image,
      Value<double> rating,
      Value<String> message,
    });

final class $$ReviewsTableReferences
    extends BaseReferences<_$AppDatabase, $ReviewsTable, ReviewTable> {
  $$ReviewsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
        $_aliasNameGenerator(db.reviews.productId, db.products.productId),
      );

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.productId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReviewsTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewId => $composableBuilder(
    column: $table.reviewId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewId => $composableBuilder(
    column: $table.reviewId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get reviewId =>
      $composableBuilder(column: $table.reviewId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedAt => $composableBuilder(
    column: $table.modifiedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReviewsTable,
          ReviewTable,
          $$ReviewsTableFilterComposer,
          $$ReviewsTableOrderingComposer,
          $$ReviewsTableAnnotationComposer,
          $$ReviewsTableCreateCompanionBuilder,
          $$ReviewsTableUpdateCompanionBuilder,
          (ReviewTable, $$ReviewsTableReferences),
          ReviewTable,
          PrefetchHooks Function({bool productId})
        > {
  $$ReviewsTableTableManager(_$AppDatabase db, $ReviewsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ReviewsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ReviewsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ReviewsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> reviewId = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> modifiedAt = const Value.absent(),
                Value<String> firstName = const Value.absent(),
                Value<String> lastName = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<String> message = const Value.absent(),
              }) => ReviewsCompanion(
                id: id,
                reviewId: reviewId,
                productId: productId,
                createdAt: createdAt,
                modifiedAt: modifiedAt,
                firstName: firstName,
                lastName: lastName,
                image: image,
                rating: rating,
                message: message,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int reviewId,
                required int productId,
                required DateTime createdAt,
                required DateTime modifiedAt,
                required String firstName,
                required String lastName,
                required String image,
                required double rating,
                required String message,
              }) => ReviewsCompanion.insert(
                id: id,
                reviewId: reviewId,
                productId: productId,
                createdAt: createdAt,
                modifiedAt: modifiedAt,
                firstName: firstName,
                lastName: lastName,
                image: image,
                rating: rating,
                message: message,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ReviewsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (productId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.productId,
                            referencedTable: $$ReviewsTableReferences
                                ._productIdTable(db),
                            referencedColumn:
                                $$ReviewsTableReferences
                                    ._productIdTable(db)
                                    .productId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReviewsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReviewsTable,
      ReviewTable,
      $$ReviewsTableFilterComposer,
      $$ReviewsTableOrderingComposer,
      $$ReviewsTableAnnotationComposer,
      $$ReviewsTableCreateCompanionBuilder,
      $$ReviewsTableUpdateCompanionBuilder,
      (ReviewTable, $$ReviewsTableReferences),
      ReviewTable,
      PrefetchHooks Function({bool productId})
    >;
typedef $$ProductImagesTableCreateCompanionBuilder =
    ProductImagesCompanion Function({
      Value<int> id,
      required int productId,
      required String image,
    });
typedef $$ProductImagesTableUpdateCompanionBuilder =
    ProductImagesCompanion Function({
      Value<int> id,
      Value<int> productId,
      Value<String> image,
    });

final class $$ProductImagesTableReferences
    extends
        BaseReferences<_$AppDatabase, $ProductImagesTable, ProductImageTable> {
  $$ProductImagesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
        $_aliasNameGenerator(db.productImages.productId, db.products.productId),
      );

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.productId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductImagesTableFilterComposer
    extends Composer<_$AppDatabase, $ProductImagesTable> {
  $$ProductImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductImagesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductImagesTable> {
  $$ProductImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductImagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductImagesTable> {
  $$ProductImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductImagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductImagesTable,
          ProductImageTable,
          $$ProductImagesTableFilterComposer,
          $$ProductImagesTableOrderingComposer,
          $$ProductImagesTableAnnotationComposer,
          $$ProductImagesTableCreateCompanionBuilder,
          $$ProductImagesTableUpdateCompanionBuilder,
          (ProductImageTable, $$ProductImagesTableReferences),
          ProductImageTable,
          PrefetchHooks Function({bool productId})
        > {
  $$ProductImagesTableTableManager(_$AppDatabase db, $ProductImagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ProductImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$ProductImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ProductImagesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<String> image = const Value.absent(),
              }) => ProductImagesCompanion(
                id: id,
                productId: productId,
                image: image,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int productId,
                required String image,
              }) => ProductImagesCompanion.insert(
                id: id,
                productId: productId,
                image: image,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ProductImagesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (productId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.productId,
                            referencedTable: $$ProductImagesTableReferences
                                ._productIdTable(db),
                            referencedColumn:
                                $$ProductImagesTableReferences
                                    ._productIdTable(db)
                                    .productId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductImagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductImagesTable,
      ProductImageTable,
      $$ProductImagesTableFilterComposer,
      $$ProductImagesTableOrderingComposer,
      $$ProductImagesTableAnnotationComposer,
      $$ProductImagesTableCreateCompanionBuilder,
      $$ProductImagesTableUpdateCompanionBuilder,
      (ProductImageTable, $$ProductImagesTableReferences),
      ProductImageTable,
      PrefetchHooks Function({bool productId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$ReviewsTableTableManager get reviews =>
      $$ReviewsTableTableManager(_db, _db.reviews);
  $$ProductImagesTableTableManager get productImages =>
      $$ProductImagesTableTableManager(_db, _db.productImages);
}
