// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandResponse _$BrandResponseFromJson(Map<String, dynamic> json) =>
    BrandResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Brand.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String?,
      message: json['message'] as String?,
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrandResponseToJson(BrandResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'path': instance.path,
      'message': instance.message,
      'meta': instance.meta,
    };

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      handle: json['handle'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      metadata: json['metadata'],
      createdById: json['createdById'] as String?,
      status: json['status'] as String?,
      image: json['image'] as String?,
      count: json['_count'] == null
          ? null
          : ProductCount.fromJson(json['_count'] as Map<String, dynamic>),
      productCount: (json['productCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'handle': instance.handle,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'metadata': instance.metadata,
      'createdById': instance.createdById,
      'status': instance.status,
      'image': instance.image,
      '_count': instance.count,
      'productCount': instance.productCount,
    };

ProductCount _$ProductCountFromJson(Map<String, dynamic> json) => ProductCount(
      products: (json['products'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductCountToJson(ProductCount instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      total: (json['total'] as num?)?.toInt(),
      items: (json['items'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      perPage: (json['perPage'] as num?)?.toInt(),
      lastPage: (json['lastPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'total': instance.total,
      'items': instance.items,
      'currentPage': instance.currentPage,
      'perPage': instance.perPage,
      'lastPage': instance.lastPage,
    };
