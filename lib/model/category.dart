import 'dart:convert';

class CategoryResponse {
  String status;
  Data data;

  CategoryResponse({
    this.status,
    this.data,
  });

  factory CategoryResponse.fromRawJson(String str) =>
      CategoryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  List<Link> links;
  Products products;

  Data({
    this.links,
    this.products,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        products: json["products"] == null
            ? null
            : Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "links": links == null
            ? null
            : List<dynamic>.from(links.map((x) => x.toJson())),
        "products": products == null ? null : products.toJson(),
      };
}

class Link {
  String title;
  String slug;

  Link({
    this.title,
    this.slug,
  });

  factory Link.fromRawJson(String str) => Link.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
      };
}

class Products {
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Products({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Products.fromRawJson(String str) =>
      Products.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl:
            json["first_page_url"] == null ? null : json["first_page_url"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        lastPageUrl:
            json["last_page_url"] == null ? null : json["last_page_url"],
        nextPageUrl:
            json["next_page_url"] == null ? null : json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl == null ? null : firstPageUrl,
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "last_page_url": lastPageUrl == null ? null : lastPageUrl,
        "next_page_url": nextPageUrl == null ? null : nextPageUrl,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "prev_page_url": prevPageUrl,
        "to": to == null ? null : to,
        "total": total == null ? null : total,
      };
}

class Datum {
  int id;
  String title;
  String slug;
  String image;
  double price;
  int quantity;
  int discount;
  DiscountType discountType;
  String resourceUrl;
  double newPrice;
  String description;

  Datum({
    this.id,
    this.title,
    this.slug,
    this.image,
    this.price,
    this.quantity,
    this.discount,
    this.discountType,
    this.resourceUrl,
    this.newPrice,
    this.description,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        image: json["image"] == null ? null : json["image"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        quantity: json["quantity"] == null ? null : json["quantity"],
        discount: json["discount"] == null ? null : json["discount"],
        discountType: json["discount_type"] == null
            ? null
            : discountTypeValues.map[json["discount_type"]],
        resourceUrl: json["resource_url"] == null ? null : json["resource_url"],
        newPrice: json["newPrice"] == null ? null : json["newPrice"].toDouble(),
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "image": image == null ? null : image,
        "price": price == null ? null : price,
        "quantity": quantity == null ? null : quantity,
        "discount": discount == null ? null : discount,
        "discount_type": discountType == null
            ? null
            : discountTypeValues.reverse[discountType],
        "resource_url": resourceUrl == null ? null : resourceUrl,
        "newPrice": newPrice == null ? null : newPrice,
        "description": description == null ? null : description,
      };
}

enum DiscountType { NO }

final discountTypeValues = EnumValues({"no": DiscountType.NO});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
