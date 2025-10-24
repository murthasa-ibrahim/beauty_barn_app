class SimilarProductResponse {
  int? statusCode;
  bool? success;
  List<SimilarProduct>? data;

  SimilarProductResponse({
    this.statusCode,
    this.success,
    this.data,
  });

  factory SimilarProductResponse.fromJson(Map<String, dynamic> json) {
    return SimilarProductResponse(
      statusCode: json['statusCode'] as int?,
      success: json['success'] as bool?,
      data: (json['data'] as List?)
          ?.map((e) => SimilarProduct.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'success': success,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

class SimilarProduct {
  String? id;
  String? title;
  String? description;
  String? thumbnail;
  double? priceStart;
  double? priceEnd;
  double? averageRating;
  int? discountPercent;
  SimilarProductBrand? brand;
  List<ProductImage>? productImages;
  List<Variant>? variants;

  SimilarProduct({
    this.id,
    this.title,
    this.description,
    this.thumbnail,
    this.priceStart,
    this.priceEnd,
    this.averageRating,
    this.discountPercent,
    this.brand,
    this.productImages,
    this.variants,
  });

  factory SimilarProduct.fromJson(Map<String, dynamic> json) {
    return SimilarProduct(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      priceStart: (json['priceStart'] as num?)?.toDouble(),
      priceEnd: (json['priceEnd'] as num?)?.toDouble(),
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      discountPercent: (json['discountPercent'] as num?)?.toInt(),
      brand: json['brand'] != null ? SimilarProductBrand.fromJson(json['brand']) : null,
      productImages: (json['productImages'] as List?)
          ?.map((e) => ProductImage.fromJson(e))
          .toList(),
      variants: (json['variants'] as List?)
          ?.map((e) => Variant.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'thumbnail': thumbnail,
        'priceStart': priceStart,
        'priceEnd': priceEnd,
        'averageRating': averageRating,
        'discountPercent': discountPercent,
        'brand': brand?.toJson(),
        'productImages': productImages?.map((e) => e.toJson()).toList(),
        'variants': variants?.map((e) => e.toJson()).toList(),
      };
}

class SimilarProductBrand {
  String? id;
  String? title;
  String? handle;
  String? description;
  String? image;

  SimilarProductBrand({
    this.id,
    this.title,
    this.handle,
    this.description,
    this.image,
  });

  factory SimilarProductBrand.fromJson(Map<String, dynamic> json) {
    return SimilarProductBrand(
      id: json['id'] as String?,
      title: json['title'] as String?,
      handle: json['handle'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'handle': handle,
        'description': description,
        'image': image,
      };
}

class ProductImage {
  String? id;
  String? image;

  ProductImage({
    this.id,
    this.image,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
      };
}

class Variant {
  String? id;
  String? title;
  double? price;
  double? specialPrice;
  String? thumbnail;

  Variant({
    this.id,
    this.title,
    this.price,
    this.specialPrice,
    this.thumbnail,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      id: json['id'] as String?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      specialPrice: (json['specialPrice'] as num?)?.toDouble(),
      thumbnail: json['thumbnail'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'specialPrice': specialPrice,
        'thumbnail': thumbnail,
      };
}
