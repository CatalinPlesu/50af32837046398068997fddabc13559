import 'package:ebs_application/data/datasources/local/database/app_database.dart';
import 'package:ebs_application/data/models/category_model.dart';
import 'package:ebs_application/data/models/product_model.dart';
import 'package:ebs_application/data/models/review_model.dart';
import 'package:drift/drift.dart';

abstract class MobileShopLocalDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts({int page = 1, int pageSize = 10});
  Future<List<ProductModel>> getBestSellingProducts({
    int page = 1,
    int pageSize = 10,
  });
  Future<ProductModel?> getFullProductDetails(int id);
  Future<List<ReviewModel>> getProductReviews(int productId);
  Future<bool> addProductReview(int productId, ReviewModel review);

  Future<void> insertProduct(ProductModel product);
  Future<void> insertProducts(List<ProductModel> products);
  Future<void> insertCategory(CategoryModel category);
  Future<void> insertCategories(List<CategoryModel> categories);
  Future<void> insertReview(ReviewModel review);
  Future<void> insertReviews(List<ReviewModel> reviews);
}

class MobileShopLocalDataSourceImpl implements MobileShopLocalDataSource {
  final AppDatabase database;

  MobileShopLocalDataSourceImpl({required this.database});

  @override
  Future<List<CategoryModel>> getCategories() async {
    final categories = await database.getCategories();
    return categories
        .map(
          (category) => CategoryModel(
            id: category.categoryId,
            name: category.name,
            iconUrl: category.iconUrl,
          ),
        )
        .toList();
  }

  @override
  Future<List<ProductModel>> getProducts({
    int page = 1,
    int pageSize = 10,
  }) async {
    final products = await database.getProducts(page: page, pageSize: pageSize);
    final productModels = <ProductModel>[];

    for (final product in products) {
      final details = await database.getFullProductDetails(product.productId);
      if (details != null) {
        productModels.add(
          ProductModel(
            id: details.product.productId,
            name: details.product.name,
            details: details.product.details,
            size: details.product.size,
            color: details.product.color,
            price: details.product.price,
            mainImageUrl: details.product.mainImageUrl,
            category: CategoryModel(
              id: details.category.categoryId,
              name: details.category.name,
              iconUrl: details.category.iconUrl,
            ),
            soldCount: details.product.soldCount,
            imagesUrl: details.images.map((img) => img.imageUrl).toList(),
            reviews:
                details.reviews
                    .map(
                      (review) => ReviewModel(
                        id: review.reviewId,
                        productId: review.productId,
                        userId: review.userId,
                        firstName: review.firstName,
                        lastName: review.lastName,
                        userImage: review.userImage,
                        rating: review.rating,
                        comment: review.comment,
                        message: review.message,
                        createdAt: review.createdAt,
                        modifiedAt: review.modifiedAt,
                      ),
                    )
                    .toList(),
          ),
        );
      }
    }

    return productModels;
  }

  @override
  Future<List<ProductModel>> getBestSellingProducts({
    int page = 1,
    int pageSize = 10,
  }) async {
    final products = await database.getBestSellingProducts(
      page: page,
      pageSize: pageSize,
    );
    final productModels = <ProductModel>[];

    for (final product in products) {
      final details = await database.getFullProductDetails(product.productId);
      if (details != null) {
        productModels.add(
          ProductModel(
            id: details.product.productId,
            name: details.product.name,
            details: details.product.details,
            size: details.product.size,
            color: details.product.color,
            price: details.product.price,
            mainImageUrl: details.product.mainImageUrl,
            category: CategoryModel(
              id: details.category.categoryId,
              name: details.category.name,
              iconUrl: details.category.iconUrl,
            ),
            soldCount: details.product.soldCount,
            imagesUrl: details.images.map((img) => img.imageUrl).toList(),
            reviews:
                details.reviews
                    .map(
                      (review) => ReviewModel(
                        id: review.reviewId,
                        productId: review.productId,
                        userId: review.userId,
                        firstName: review.firstName,
                        lastName: review.lastName,
                        userImage: review.userImage,
                        rating: review.rating,
                        comment: review.comment,
                        message: review.message,
                        createdAt: review.createdAt,
                        modifiedAt: review.modifiedAt,
                      ),
                    )
                    .toList(),
          ),
        );
      }
    }

    return productModels;
  }

  @override
  Future<ProductModel?> getFullProductDetails(int id) async {
    final details = await database.getFullProductDetails(id);
    if (details == null) return null;

    return ProductModel(
      id: details.product.productId,
      name: details.product.name,
      details: details.product.details,
      size: details.product.size,
      color: details.product.color,
      price: details.product.price,
      mainImageUrl: details.product.mainImageUrl,
      category: CategoryModel(
        id: details.category.categoryId,
        name: details.category.name,
        iconUrl: details.category.iconUrl,
      ),
      soldCount: details.product.soldCount,
      imagesUrl: details.images.map((img) => img.imageUrl).toList(),
      reviews:
          details.reviews
              .map(
                (review) => ReviewModel(
                  id: review.reviewId,
                  productId: review.productId,
                  userId: review.userId,
                  firstName: review.firstName,
                  lastName: review.lastName,
                  userImage: review.userImage,
                  rating: review.rating,
                  comment: review.comment,
                  createdAt: review.createdAt,
                  modifiedAt: review.modifiedAt,
                ),
              )
              .toList(),
    );
  }

  @override
  Future<List<ReviewModel>> getProductReviews(int productId) async {
    final reviews = await database.getProductReviews(productId);
    return reviews
        .map(
          (review) => ReviewModel(
            id: review.reviewId,
            productId: review.productId,
            userId: review.userId,
            firstName: review.firstName,
            lastName: review.lastName,
            userImage: review.userImage,
            rating: review.rating,
            comment: review.comment,
            createdAt: review.createdAt,
            modifiedAt: review.modifiedAt,
          ),
        )
        .toList();
  }

  @override
  Future<bool> addProductReview(int productId, ReviewModel review) async {
    return await database.addProductReview(
      ReviewsCompanion.insert(
        reviewId: review.id,
        productId: review.productId,
        userId: review.userId,
        firstName: review.firstName,
        lastName: review.lastName,
        userImage: review.userImage,
        rating: review.rating,
        comment: review.comment,
        createdAt: review.createdAt,
        modifiedAt: review.modifiedAt,
        lastUpdated: DateTime.now(),
      ),
    );
  }

  @override
  Future<void> insertProduct(ProductModel product) async {
    final now = DateTime.now();
    await database.insertProduct(
      ProductsCompanion.insert(
        productId: product.id,
        name: product.name,
        details: product.details,
        size: product.size,
        color: product.color,
        price: product.price,
        mainImageUrl: product.mainImageUrl,
        categoryId: product.category.id,
        soldCount: Value(product.soldCount),
        lastUpdated: now,
      ),
    );

    for (final imageUrl in product.imagesUrl) {
      await database.insertProductImage(
        ProductImagesCompanion.insert(
          productId: product.id,
          imageUrl: imageUrl,
          lastUpdated: now,
        ),
      );
    }
  }

  @override
  Future<void> insertProducts(List<ProductModel> products) async {
    for (final product in products) {
      await insertProduct(product);
    }
  }

  @override
  Future<void> insertCategory(CategoryModel category) async {
    await database.insertCategory(
      CategoriesCompanion.insert(
        categoryId: category.id,
        name: category.name,
        iconUrl: category.iconUrl,
        lastUpdated: DateTime.now(),
      ),
    );
  }

  @override
  Future<void> insertCategories(List<CategoryModel> categories) async {
    for (final category in categories) {
      await insertCategory(category);
    }
  }

  @override
  Future<void> insertReview(ReviewModel review) async {
    await database.insertReview(
      ReviewsCompanion.insert(
        reviewId: review.id,
        productId: review.productId,
        userId: review.userId,
        firstName: review.firstName,
        lastName: review.lastName,
        userImage: review.userImage,
        rating: review.rating,
        comment: review.comment,
        message: review.message,
        createdAt: review.createdAt,
        modifiedAt: review.modifiedAt,
        lastUpdated: DateTime.now(),
      ),
    );
  }

  @override
  Future<void> insertReviews(List<ReviewModel> reviews) async {
    for (final review in reviews) {
      await insertReview(review);
    }
  }
}
