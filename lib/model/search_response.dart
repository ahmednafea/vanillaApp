import 'dart:convert';

class SearchResponse {
  List<ProductModel> products;

  SearchResponse({
    this.products,
  });

  factory SearchResponse.fromRawJson(String str) =>
      SearchResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        products: json["products"] == null
            ? null
            : List<ProductModel>.from(
                json["products"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ProductModel {
  int id;
  String title;
  String slug;
  String image;
  String resourceUrl;
  dynamic newPrice;
  String description;

  ProductModel({
    this.id,
    this.title,
    this.slug,
    this.image,
    this.resourceUrl,
    this.newPrice,
    this.description,
  });

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        image: json["image"] == null ? null : json["image"],
        resourceUrl: json["resource_url"] == null ? null : json["resource_url"],
        newPrice: json["newPrice"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "image": image == null ? null : image,
        "resource_url": resourceUrl == null ? null : resourceUrl,
        "newPrice": newPrice,
        "description": description == null ? null : description,
      };
}
