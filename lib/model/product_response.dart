import 'dart:convert';

class ProductResponse {
  Product product;
  List<Related> related;

  ProductResponse({
    this.product,
    this.related,
  });

  factory ProductResponse.fromRawJson(String str) =>
      ProductResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        related: json["related"] == null
            ? null
            : List<Related>.from(
                json["related"].map((x) => Related.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product": product == null ? null : product.toJson(),
        "related": related == null
            ? null
            : List<dynamic>.from(related.map((x) => x.toJson())),
      };
}

class Product {
  int id;
  String title;
  String description;
  String image;
  int quantity;
  double price;
  int discount;
  int visits;
  String discountType;
  int enabled;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String resourceUrl;
  double newPrice;
  List<Category> categories;
  List<dynamic> images;

  Product({
    this.id,
    this.title,
    this.description,
    this.image,
    this.quantity,
    this.price,
    this.discount,
    this.visits,
    this.discountType,
    this.enabled,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.resourceUrl,
    this.newPrice,
    this.categories,
    this.images,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        discount: json["discount"] == null ? null : json["discount"],
        visits: json["visits"] == null ? null : json["visits"],
        discountType:
            json["discount_type"] == null ? null : json["discount_type"],
        enabled: json["enabled"] == null ? null : json["enabled"],
        slug: json["slug"] == null ? null : json["slug"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        resourceUrl: json["resource_url"] == null ? null : json["resource_url"],
        newPrice: json["newPrice"] == null ? null : json["newPrice"].toDouble(),
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        images: json["images"] == null
            ? null
            : List<dynamic>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "image": image == null ? null : image,
        "quantity": quantity == null ? null : quantity,
        "price": price == null ? null : price,
        "discount": discount == null ? null : discount,
        "visits": visits == null ? null : visits,
        "discount_type": discountType == null ? null : discountType,
        "enabled": enabled == null ? null : enabled,
        "slug": slug == null ? null : slug,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "resource_url": resourceUrl == null ? null : resourceUrl,
        "newPrice": newPrice == null ? null : newPrice,
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x.toJson())),
        "images":
            images == null ? null : List<dynamic>.from(images.map((x) => x)),
      };
}

class Category {
  int catId;
  String resourceUrl;
  Pivot pivot;
  String title;
  String slug;

  Category({
    this.catId,
    this.resourceUrl,
    this.pivot,
    this.title,
    this.slug,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        catId: json["cat_id"] == null ? null : json["cat_id"],
        resourceUrl: json["resource_url"] == null ? null : json["resource_url"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "cat_id": catId == null ? null : catId,
        "resource_url": resourceUrl == null ? null : resourceUrl,
        "pivot": pivot == null ? null : pivot.toJson(),
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
      };
}

class Pivot {
  int productId;
  int categoryId;

  Pivot({
    this.productId,
    this.categoryId,
  });

  factory Pivot.fromRawJson(String str) => Pivot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        productId: json["product_id"] == null ? null : json["product_id"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "category_id": categoryId == null ? null : categoryId,
      };
}

class Related {
  int id;
  String title;
  String description;
  String image;
  int quantity;
  double price;
  int discount;
  int visits;
  String discountType;
  int enabled;
  String slug;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  int productId;
  int categoryId;
  String resourceUrl;
  double newPrice;

  Related({
    this.id,
    this.title,
    this.description,
    this.image,
    this.quantity,
    this.price,
    this.discount,
    this.visits,
    this.discountType,
    this.enabled,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.productId,
    this.categoryId,
    this.resourceUrl,
    this.newPrice,
  });

  factory Related.fromRawJson(String str) => Related.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Related.fromJson(Map<String, dynamic> json) => Related(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        discount: json["discount"] == null ? null : json["discount"],
        visits: json["visits"] == null ? null : json["visits"],
        discountType:
            json["discount_type"] == null ? null : json["discount_type"],
        enabled: json["enabled"] == null ? null : json["enabled"],
        slug: json["slug"] == null ? null : json["slug"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        productId: json["product_id"] == null ? null : json["product_id"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        resourceUrl: json["resource_url"] == null ? null : json["resource_url"],
        newPrice: json["newPrice"] == null ? null : json["newPrice"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "image": image == null ? null : image,
        "quantity": quantity == null ? null : quantity,
        "price": price == null ? null : price,
        "discount": discount == null ? null : discount,
        "visits": visits == null ? null : visits,
        "discount_type": discountType == null ? null : discountType,
        "enabled": enabled == null ? null : enabled,
        "slug": slug == null ? null : slug,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "product_id": productId == null ? null : productId,
        "category_id": categoryId == null ? null : categoryId,
        "resource_url": resourceUrl == null ? null : resourceUrl,
        "newPrice": newPrice == null ? null : newPrice,
      };
}
