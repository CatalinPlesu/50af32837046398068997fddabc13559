import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Products, Categories, Reviews, ProductImages])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  // Category operations
  Future<List<CategoryTable>> getCategories() => select(categories).get();

  // Product operations
  Future<List<ProductTable>> getProducts({int page = 1, int pageSize = 10}) {
    final offset = (page - 1) * pageSize;
    return (select(products)..limit(pageSize, offset: offset)).get();
  }

  Future<List<ProductTable>> getBestSellingProducts({
    int page = 1,
    int pageSize = 10,
  }) {
    final offset = (page - 1) * pageSize;
    return (select(products)
          ..orderBy([(t) => OrderingTerm.desc(t.soldCount)])
          ..limit(pageSize, offset: offset))
        .get();
  }

  Future<ProductWithDetails?> getFullProductDetails(int id) async {
    final query = select(products).join([
      innerJoin(
        categories,
        categories.categoryId.equalsExp(products.categoryId),
      ),
    ]);

    query.where(products.productId.equals(id)); // <-- FIXED

    final results = await query.get();
    if (results.isEmpty) return null;

    final row = results.first;
    final product = row.readTable(products);
    final category = row.readTable(categories);
    final reviews = await getProductReviews(id);
    final images = await getProductImages(id);

    return ProductWithDetails(
      product: product,
      category: category,
      reviews: reviews,
      images: images,
    );
  }

  // Review operations
  Future<List<ReviewTable>> getProductReviews(int productId) =>
      (select(reviews)..where((t) => t.productId.equals(productId))).get();

  Future<bool> addProductReview(ReviewsCompanion review) async {
    try {
      await into(reviews).insert(review);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Product Image operations
  Future<List<ProductImageTable>> getProductImages(int productId) =>
      (select(productImages)
        ..where((t) => t.productId.equals(productId))).get();

  // Insert operations
  Future<int> insertProduct(ProductsCompanion product) =>
      into(products).insert(product);

  Future<int> insertProductImage(ProductImagesCompanion image) =>
      into(productImages).insert(image);

  Future<int> insertCategory(CategoriesCompanion category) =>
      into(categories).insert(category);

  Future<int> insertReview(ReviewsCompanion review) =>
      into(reviews).insert(review);
}

// Data classes for relationship queries
class ProductWithDetails {
  final ProductTable product;
  final CategoryTable category;
  final List<ReviewTable> reviews;
  final List<ProductImageTable> images;

  ProductWithDetails({
    required this.product,
    required this.category,
    required this.reviews,
    required this.images,
  });
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
