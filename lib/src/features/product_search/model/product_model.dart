import 'dart:convert';

ProductResponse productResponseFromJson(String str) =>
    ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) =>
    json.encode(data.toJson());

class ProductResponse {
  final int? statusCode;
  final bool? success;
  final List<Product>? data;
  final String? path;
  final String? message;
  final Meta? meta;

  ProductResponse({
    this.statusCode,
    this.success,
    this.data,
    this.path,
    this.message,
    this.meta,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        statusCode: json["statusCode"],
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        path: json["path"],
        message: json["message"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "path": path,
        "message": message,
        "meta": meta?.toJson(),
      };
}

class Product {
  final String? id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? thumbnail;
  final String? handle;
  final String? metaDescription;
  final String? metaTitle;
  final String? status;
  final String? visibility;
  final int? reviewsCount;
  final double? averageRating;
  final int? ordersCount;
  final List<ProductImage>? productImages;
  final List<Variant>? variants;
  final List<Review>? reviews;
  final double? priceStart;
  final double? priceEnd;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Product({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.thumbnail,
    this.handle,
    this.metaDescription,
    this.metaTitle,
    this.status,
    this.visibility,
    this.reviewsCount,
    this.averageRating,
    this.ordersCount,
    this.productImages,
    this.variants,
    this.reviews,
    this.priceStart,
    this.priceEnd,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        handle: json["handle"],
        metaDescription: json["metaDescription"],
        metaTitle: json["metaTitle"],
        status: json["status"],
        visibility: json["visibility"],
        reviewsCount: json["reviewsCount"],
        averageRating: json["averageRating"]?.toDouble(),
        ordersCount: json["ordersCount"],
        productImages: json["productImages"] == null
            ? []
            : List<ProductImage>.from(
                json["productImages"].map((x) => ProductImage.fromJson(x))),
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"].map((x) => Variant.fromJson(x))),
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        priceStart: json["priceStart"]?.toDouble(),
        priceEnd: json["priceEnd"]?.toDouble(),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.tryParse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.tryParse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "thumbnail": thumbnail,
        "handle": handle,
        "metaDescription": metaDescription,
        "metaTitle": metaTitle,
        "status": status,
        "visibility": visibility,
        "reviewsCount": reviewsCount,
        "averageRating": averageRating,
        "ordersCount": ordersCount,
        "productImages": productImages == null
            ? []
            : List<dynamic>.from(productImages!.map((x) => x.toJson())),
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "priceStart": priceStart,
        "priceEnd": priceEnd,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class ProductImage {
  final String? id;
  final String? image;
  final int? order;

  ProductImage({
    this.id,
    this.image,
    this.order,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        image: json["image"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "order": order,
      };
}

class Variant {
  final String? id;
  final String? title;
  final String? sku;
  final double? price;
  final double? originalPrice;
  final double? currentPrice;
  final String? thumbnail;
  final List<VariantImage>? images;
  final List<OptionValue>? optionValues;

  Variant({
    this.id,
    this.title,
    this.sku,
    this.price,
    this.originalPrice,
    this.currentPrice,
    this.thumbnail,
    this.images,
    this.optionValues,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        title: json["title"],
        sku: json["sku"],
        price: json["price"]?.toDouble(),
        originalPrice: json["originalPrice"]?.toDouble(),
        currentPrice: json["currentPrice"]?.toDouble(),
        thumbnail: json["thumbnail"],
        images: json["images"] == null
            ? []
            : List<VariantImage>.from(
                json["images"].map((x) => VariantImage.fromJson(x))),
        optionValues: json["optionValues"] == null
            ? []
            : List<OptionValue>.from(
                json["optionValues"].map((x) => OptionValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "sku": sku,
        "price": price,
        "originalPrice": originalPrice,
        "currentPrice": currentPrice,
        "thumbnail": thumbnail,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "optionValues": optionValues == null
            ? []
            : List<dynamic>.from(optionValues!.map((x) => x.toJson())),
      };
}

class VariantImage {
  final String? id;
  final String? image;
  final int? order;

  VariantImage({
    this.id,
    this.image,
    this.order,
  });

  factory VariantImage.fromJson(Map<String, dynamic> json) => VariantImage(
        id: json["id"],
        image: json["image"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "order": order,
      };
}

class OptionValue {
  final String? id;
  final String? value;
  final ProductOption? productOption;

  OptionValue({
    this.id,
    this.value,
    this.productOption,
  });

  factory OptionValue.fromJson(Map<String, dynamic> json) => OptionValue(
        id: json["id"],
        value: json["value"],
        productOption: json["productOption"] == null
            ? null
            : ProductOption.fromJson(json["productOption"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "productOption": productOption?.toJson(),
      };
}

class ProductOption {
  final String? id;
  final String? title;

  ProductOption({
    this.id,
    this.title,
  });

  factory ProductOption.fromJson(Map<String, dynamic> json) => ProductOption(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}

class Review {
  final String? id;
  final int? rating;
  final String? comment;
  final String? firstName;
  final String? lastName;
  final DateTime? createdAt;

  Review({
    this.id,
    this.rating,
    this.comment,
    this.firstName,
    this.lastName,
    this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        rating: json["rating"],
        comment: json["comment"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.tryParse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "comment": comment,
        "firstName": firstName,
        "lastName": lastName,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class Meta {
  final int? total;
  final int? items;
  final int? currentPage;
  final int? perPage;
  final int? lastPage;

  Meta({
    this.total,
    this.items,
    this.currentPage,
    this.perPage,
    this.lastPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
        items: json["items"],
        currentPage: json["currentPage"],
        perPage: json["perPage"],
        lastPage: json["lastPage"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "items": items,
        "currentPage": currentPage,
        "perPage": perPage,
        "lastPage": lastPage,
      };
}
