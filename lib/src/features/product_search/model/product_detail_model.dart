import 'dart:convert';

ProductDetailResponse productDetailResponseFromJson(String str) =>
    ProductDetailResponse.fromJson(json.decode(str));

String productDetailResponseToJson(ProductDetailResponse data) =>
    json.encode(data.toJson());

class ProductDetailResponse {
  final int? statusCode;
  final bool? success;
  final ProductDetailData? data;
  final String? path;
  final String? message;

  ProductDetailResponse({
    this.statusCode,
    this.success,
    this.data,
    this.path,
    this.message,
  });

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      ProductDetailResponse(
        statusCode: json["statusCode"],
        success: json["success"],
        data: json["data"] != null
            ? ProductDetailData.fromJson(json["data"])
            : null,
        path: json["path"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "data": data?.toJson(),
        "path": path,
        "message": message,
      };
}

class ProductDetailData {
  final String? id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? thumbnail;
  final String? handle;
  final String? status;
  final String? visibility;
  final double? averageRating;
  final int? reviewsCount;
  final int? ordersCount;
  final double? priceStart;
  final double? priceEnd;
  final BrandProductDetail? brand;
  final List<ProductImage>? productImages;
  final List<ProductCategoryWrapper>? productCategories;
  final List<ProductTab>? tabs;
  final List<ProductVariant>? variants;
  final List<ProductOption>? options;
  final List<Breadcrumb>? breadCrumbs;

  ProductDetailData({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.thumbnail,
    this.handle,
    this.status,
    this.visibility,
    this.averageRating,
    this.reviewsCount,
    this.ordersCount,
    this.priceStart,
    this.priceEnd,
    this.brand,
    this.productImages,
    this.productCategories,
    this.tabs,
    this.variants,
    this.options,
    this.breadCrumbs,
  });

  factory ProductDetailData.fromJson(Map<String, dynamic> json) =>
      ProductDetailData(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        handle: json["handle"],
        status: json["status"],
        visibility: json["visibility"],
        averageRating: (json["averageRating"] != null)
            ? (json["averageRating"] as num).toDouble()
            : null,
        reviewsCount: json["reviewsCount"],
        ordersCount: json["ordersCount"],
        priceStart: (json["priceStart"] != null)
            ? (json["priceStart"] as num).toDouble()
            : null,
        priceEnd: (json["priceEnd"] != null)
            ? (json["priceEnd"] as num).toDouble()
            : null,
        brand: json["brand"] != null ? BrandProductDetail.fromJson(json["brand"]) : null,
        productImages: json["productImages"] != null
            ? List<ProductImage>.from(
                json["productImages"].map((x) => ProductImage.fromJson(x)))
            : [],
        productCategories: json["productCategories"] != null
            ? List<ProductCategoryWrapper>.from(json["productCategories"]
                .map((x) => ProductCategoryWrapper.fromJson(x)))
            : [],
        tabs: json["tabs"] != null
            ? List<ProductTab>.from(
                json["tabs"].map((x) => ProductTab.fromJson(x)))
            : [],
        variants: json["variants"] != null
            ? List<ProductVariant>.from(
                json["variants"].map((x) => ProductVariant.fromJson(x)))
            : [],
        options: json["options"] != null
            ? List<ProductOption>.from(
                json["options"].map((x) => ProductOption.fromJson(x)))
            : [],
        breadCrumbs: json["breadCrumbs"] != null
            ? List<Breadcrumb>.from(
                json["breadCrumbs"].map((x) => Breadcrumb.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "thumbnail": thumbnail,
        "handle": handle,
        "status": status,
        "visibility": visibility,
        "averageRating": averageRating,
        "reviewsCount": reviewsCount,
        "ordersCount": ordersCount,
        "priceStart": priceStart,
        "priceEnd": priceEnd,
        "brand": brand?.toJson(),
        "productImages": productImages?.map((x) => x.toJson()).toList(),
        "productCategories":
            productCategories?.map((x) => x.toJson()).toList(),
        "tabs": tabs?.map((x) => x.toJson()).toList(),
        "variants": variants?.map((x) => x.toJson()).toList(),
        "options": options?.map((x) => x.toJson()).toList(),
        "breadCrumbs": breadCrumbs?.map((x) => x.toJson()).toList(),
      };
}

class BrandProductDetail {
  final String? id;
  final String? title;
  final String? description;
  final String? handle;
  final String? image;

  BrandProductDetail({this.id, this.title, this.description, this.handle, this.image});

  factory BrandProductDetail.fromJson(Map<String, dynamic> json) => BrandProductDetail(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        handle: json["handle"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "handle": handle,
        "image": image,
      };
}

class ProductImage {
  final String? id;
  final String? image;

  ProductImage({this.id, this.image});

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class ProductCategoryWrapper {
  final String? id;
  final ProductCategory? category;

  ProductCategoryWrapper({this.id, this.category});

  factory ProductCategoryWrapper.fromJson(Map<String, dynamic> json) =>
      ProductCategoryWrapper(
        id: json["id"],
        category: json["category"] != null
            ? ProductCategory.fromJson(json["category"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category?.toJson(),
      };
}

class ProductCategory {
  final String? id;
  final String? name;
  final String? description;
  final String? handle;

  ProductCategory({this.id, this.name, this.description, this.handle});

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        handle: json["handle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "handle": handle,
      };
}

class ProductTab {
  final String? id;
  final String? title;
  final String? content;

  ProductTab({this.id, this.title, this.content});

  factory ProductTab.fromJson(Map<String, dynamic> json) => ProductTab(
        id: json["id"],
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
      };
}

class ProductVariant {
  final String? id;
  final String? title;
  final String? sku;
  final double? price;
  final double? specialPrice;
  final double? currentPrice;
  final String? thumbnail;

  ProductVariant({
    this.id,
    this.title,
    this.sku,
    this.price,
    this.specialPrice,
    this.currentPrice,
    this.thumbnail,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) => ProductVariant(
        id: json["id"],
        title: json["title"],
        sku: json["sku"],
        price: (json["price"] != null) ? (json["price"] as num).toDouble() : null,
        specialPrice: (json["specialPrice"] != null)
            ? (json["specialPrice"] as num).toDouble()
            : null,
        currentPrice: (json["currentPrice"] != null)
            ? (json["currentPrice"] as num).toDouble()
            : null,
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "sku": sku,
        "price": price,
        "specialPrice": specialPrice,
        "currentPrice": currentPrice,
        "thumbnail": thumbnail,
      };
}

class ProductOption {
  final String? id;
  final String? title;

  ProductOption({this.id, this.title});

  factory ProductOption.fromJson(Map<String, dynamic> json) => ProductOption(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}

class Breadcrumb {
  final String? label;
  final String? handle;

  Breadcrumb({this.label, this.handle});

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        label: json["label"],
        handle: json["handle"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "handle": handle,
      };
}
