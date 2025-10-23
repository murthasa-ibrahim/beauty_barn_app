class SearchProductResponse {
  final int? statusCode;
  final bool? success;
  final ProductData? data;
  final String? path;
  final String? message;
  final Meta? meta;

  SearchProductResponse({
    this.statusCode,
    this.success,
    this.data,
    this.path,
    this.message,
    this.meta,
  });

  factory SearchProductResponse.fromJson(Map<String, dynamic> json) => SearchProductResponse(
        statusCode: json['statusCode'] as int?,
        success: json['success'] as bool?,
        data: json['data'] != null ? ProductData.fromJson(json['data']) : null,
        path: json['path'] as String?,
        message: json['message'] as String?,
        meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      );
}

class ProductData {
  final List<SearchProduct>? products;
  final List<Brand>? brands;
  final List<Attribute>? attributes;
  final Map<String, int>? ratingsCounts;

  ProductData({
    this.products,
    this.brands,
    this.attributes,
    this.ratingsCounts,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => SearchProduct.fromJson(e))
            .toList(),
        brands: (json['brands'] as List<dynamic>?)
            ?.map((e) => Brand.fromJson(e))
            .toList(),
        attributes: (json['attributes'] as List<dynamic>?)
            ?.map((e) => Attribute.fromJson(e))
            .toList(),
        ratingsCounts: (json['ratingsCounts'] as Map<String, dynamic>?)?.map(
          (k, v) => MapEntry(k, v as int),
        ),
      );
}

class SearchProduct {
  final String? id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? handle;
  final String? thumbnail;
  final String? status;
  final String? visibility;
  final String? publishedAt;
  final String? createdAt;
  final double? averageRating;
  final int? reviewsCount;
  final int? ordersCount;
  final Brand? brand;
  final List<ProductCategory>? productCategories;
  final List<ProductCollection>? productCollections;
  final List<ProductAttributeValue>? productValuesForAttribute;
  final List<Tag>? tags;
  final List<Variant>? variants;
  final List<ProductImage>? productImages;
  final int? priceStart;
  final int? priceEnd;

  SearchProduct({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.handle,
    this.thumbnail,
    this.status,
    this.visibility,
    this.publishedAt,
    this.createdAt,
    this.averageRating,
    this.reviewsCount,
    this.ordersCount,
    this.brand,
    this.productCategories,
    this.productCollections,
    this.productValuesForAttribute,
    this.tags,
    this.variants,
    this.productImages,
    this.priceStart,
    this.priceEnd,
  });

  factory SearchProduct.fromJson(Map<String, dynamic> json) => SearchProduct(
        id: json['id'] as String?,
        title: json['title'] as String?,
        subtitle: json['subtitle'] as String?,
        description: json['description'] as String?,
        handle: json['handle'] as String?,
        thumbnail: json['thumbnail'] as String?,
        status: json['status'] as String?,
        visibility: json['visibility'] as String?,
        publishedAt: json['publishedAt'] as String?,
        createdAt: json['createdAt'] as String?,
        averageRating: (json['averageRating'] != null)
            ? (json['averageRating'] as num).toDouble()
            : null,
        reviewsCount: json['reviewsCount'] as int?,
        ordersCount: json['ordersCount'] as int?,
        brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
        productCategories: (json['productCategories'] as List<dynamic>?)
            ?.map((e) => ProductCategory.fromJson(e))
            .toList(),
        productCollections: (json['productCollections'] as List<dynamic>?)
            ?.map((e) => ProductCollection.fromJson(e))
            .toList(),
        productValuesForAttribute:
            (json['productValuesForAttribute'] as List<dynamic>?)
                ?.map((e) => ProductAttributeValue.fromJson(e))
                .toList(),
        tags: (json['tags'] as List<dynamic>?)
            ?.map((e) => Tag.fromJson(e))
            .toList(),
        variants: (json['variants'] as List<dynamic>?)
            ?.map((e) => Variant.fromJson(e))
            .toList(),
        productImages: (json['productImages'] as List<dynamic>?)
            ?.map((e) => ProductImage.fromJson(e))
            .toList(),
        priceStart: json['priceStart'] as int?,
        priceEnd: json['priceEnd'] as int?,
      );
}

class Brand {
  final String? id;
  final String? handle;
  final String? title;
  final int? productCount;

  Brand({this.id, this.handle, this.title, this.productCount});

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json['id'] as String?,
        handle: json['handle'] as String?,
        title: json['title'] as String? ?? json['name'] as String?,
        productCount: json['productCount'] as int?,
      );
}

class ProductCategory {
  final Category? category;

  ProductCategory({this.category});

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
        category: json['category'] != null ? Category.fromJson(json['category']) : null,
      );
}

class Category {
  final String? id;
  final String? name;
  final String? handle;
  final Category? parent;

  Category({this.id, this.name, this.handle, this.parent});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as String?,
        name: json['name'] as String?,
        handle: json['handle'] as String?,
        parent: json['parent'] != null ? Category.fromJson(json['parent']) : null,
      );
}

class ProductCollection {
  ProductCollection();

  factory ProductCollection.fromJson(Map<String, dynamic> json) =>
      ProductCollection();
}

class ProductAttributeValue {
  final String? value;
  final ProductAttribute? productAttribute;
  final ProductAttributeValueDetail? productAttributeValue;

  ProductAttributeValue({this.value, this.productAttribute, this.productAttributeValue});

  factory ProductAttributeValue.fromJson(Map<String, dynamic> json) =>
      ProductAttributeValue(
        value: json['value'] as String?,
        productAttribute: json['productAttribute'] != null
            ? ProductAttribute.fromJson(json['productAttribute'])
            : null,
        productAttributeValue: json['productAttributeValue'] != null
            ? ProductAttributeValueDetail.fromJson(json['productAttributeValue'])
            : null,
      );
}

class ProductAttribute {
  final String? code;
  final String? title;

  ProductAttribute({this.code, this.title});

  factory ProductAttribute.fromJson(Map<String, dynamic> json) => ProductAttribute(
        code: json['code'] as String?,
        title: json['title'] as String?,
      );
}

class ProductAttributeValueDetail {
  final String? value;

  ProductAttributeValueDetail({this.value});

  factory ProductAttributeValueDetail.fromJson(Map<String, dynamic> json) =>
      ProductAttributeValueDetail(value: json['value'] as String?);
}

class Tag {
  final TagDetail? tag;

  Tag({this.tag});

  factory Tag.fromJson(Map<String, dynamic> json) =>
      Tag(tag: json['tag'] != null ? TagDetail.fromJson(json['tag']) : null);
}

class TagDetail {
  final String? id;
  final String? title;
  final String? slug;
  final String? description;

  TagDetail({this.id, this.title, this.slug, this.description});

  factory TagDetail.fromJson(Map<String, dynamic> json) => TagDetail(
        id: json['id'] as String?,
        title: json['title'] as String?,
        slug: json['slug'] as String?,
        description: json['description'] as String?,
      );
}

class Variant {
  final String? id;
  final int? price;
  final int? specialPrice;
  final String? specialPriceStartDate;
  final String? specialPriceEndDate;
  final int? inventoryQuantity;
  final List<dynamic>? prices;
  final int? originalPrice;
  final int? currentPrice;
  final int? specialPriceActive;
  final Map<String, dynamic>? salePrices;

  Variant({
    this.id,
    this.price,
    this.specialPrice,
    this.specialPriceStartDate,
    this.specialPriceEndDate,
    this.inventoryQuantity,
    this.prices,
    this.originalPrice,
    this.currentPrice,
    this.specialPriceActive,
    this.salePrices,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json['id'] as String?,
        price: json['price'] as int?,
        specialPrice: json['specialPrice'] as int?,
        specialPriceStartDate: json['specialPriceStartDate'] as String?,
        specialPriceEndDate: json['specialPriceEndDate'] as String?,
        inventoryQuantity: json['inventoryQuantity'] as int?,
        prices: json['prices'] as List<dynamic>?,
        originalPrice: json['originalPrice'] as int?,
        currentPrice: json['currentPrice'] as int?,
        specialPriceActive: json['specialPriceActive'] as int?,
        salePrices: json['salePrices'] as Map<String, dynamic>?,
      );
}

class ProductImage {
  final String? id;
  final String? image;

  ProductImage({this.id, this.image});

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json['id'] as String?,
        image: json['image'] as String?,
      );
}

class Attribute {
  final String? title;
  final String? code;
  final List<AttributeValue>? values;

  Attribute({this.title, this.code, this.values});

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        title: json['title'] as String?,
        code: json['code'] as String?,
        values: (json['values'] as List<dynamic>?)
            ?.map((e) => AttributeValue.fromJson(e))
            .toList(),
      );
}

class AttributeValue {
  final String? value;
  final int? productCount;

  AttributeValue({this.value, this.productCount});

  factory AttributeValue.fromJson(Map<String, dynamic> json) => AttributeValue(
        value: json['value'] as String?,
        productCount: json['productCount'] as int?,
      );
}

class Meta {
  final int? total;
  final int? items;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;

  Meta({this.total, this.items, this.perPage, this.currentPage, this.lastPage});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json['total'] as int?,
        items: json['items'] as int?,
        perPage: json['perPage'] as int?,
        currentPage: json['currentPage'] as int?,
        lastPage: json['lastPage'] as int?,
      );
}
