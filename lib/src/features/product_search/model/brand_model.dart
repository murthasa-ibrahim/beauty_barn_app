import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class BrandResponse {
  final bool? success;
  final List<Brand>? data;
  final String? path;
  final String? message;
  final Meta? meta;

  BrandResponse({
    this.success,
    this.data,
    this.path,
    this.message,
    this.meta,
  });

  factory BrandResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BrandResponseToJson(this);
}

@JsonSerializable()
class Brand {
  final String? id;
  final String? title;
  final String? description;
  final String? handle;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final dynamic metadata;
  final String? createdById;
  final String? status;
  final String? image;
  @JsonKey(name: '_count')
  final ProductCount? count;
  final int? productCount;

  Brand({
    this.id,
    this.title,
    this.description,
    this.handle,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
    this.createdById,
    this.status,
    this.image,
    this.count,
    this.productCount,
  });

  factory Brand.fromJson(Map<String, dynamic> json) =>
      _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class ProductCount {
  final int? products;

  ProductCount({this.products});

  factory ProductCount.fromJson(Map<String, dynamic> json) =>
      _$ProductCountFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCountToJson(this);
}

@JsonSerializable()
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

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
