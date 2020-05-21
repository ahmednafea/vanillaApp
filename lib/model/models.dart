class HomeModel {
  List<Slider> sliders;
  List<Category> categories;
  List<BannerElement> banners;
  List<HotDeals> hotDeals;
  int cartCount;

  HomeModel({
    this.sliders,
    this.categories,
    this.banners,
    this.hotDeals,
    this.cartCount,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        sliders: json["sliders"] == null
            ? null
            : List<Slider>.from(json["sliders"].map((x) => Slider.fromJson(x))),
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        banners: json["banners"] == null
            ? null
            : List<BannerElement>.from(
                json["banners"].map((x) => BannerElement.fromJson(x))),
        hotDeals: json["hotDeals"] == null
            ? null
            : List<HotDeals>.from(
                json["hotDeals"].map((x) => HotDeals.fromJson(x))),
        cartCount: json["cartCount"] == null ? null : json["cartCount"],
      );

  Map<String, dynamic> toJson() => {
        "sliders": sliders == null
            ? null
            : List<dynamic>.from(sliders.map((x) => x.toJson())),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x.toJson())),
        "banners": banners == null
            ? null
            : List<dynamic>.from(banners.map((x) => x.toJson())),
        "hotDeals": hotDeals == null
            ? null
            : List<dynamic>.from(hotDeals.map((x) => x)),
        "cartCount": cartCount == null ? null : cartCount,
      };
}

class BannerElement {
  int id;
  int categoryId;
  int top;
  int middle;
  String resourceUrl;
  BannerBanner banner;

  BannerElement({
    this.id,
    this.categoryId,
    this.top,
    this.middle,
    this.resourceUrl,
    this.banner,
  });

  factory BannerElement.fromJson(Map<String, dynamic> json) => BannerElement(
        id: json["id"] == null ? null : json["id"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        top: json["top"] == null ? null : json["top"],
        middle: json["middle"] == null ? null : json["middle"],
        resourceUrl: json["resource_url"] == null ? null : json["resource_url"],
        banner: json["banner"] == null
            ? null
            : BannerBanner.fromJson(json["banner"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "category_id": categoryId == null ? null : categoryId,
        "top": top == null ? null : top,
        "middle": middle == null ? null : middle,
        "resource_url": resourceUrl == null ? null : resourceUrl,
        "banner": banner == null ? null : banner.toJson(),
      };
}

class BannerBanner {
  int id;
  String title;
  String image;
  String slug;
  int inhome;
  int inbanner;
  String type;
  int parent;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String resourceUrl;

  BannerBanner({
    this.id,
    this.title,
    this.image,
    this.slug,
    this.inhome,
    this.inbanner,
    this.type,
    this.parent,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.resourceUrl,
  });

  factory BannerBanner.fromJson(Map<String, dynamic> json) => BannerBanner(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        slug: json["slug"] == null ? null : json["slug"],
        inhome: json["inhome"] == null ? null : json["inhome"],
        inbanner: json["inbanner"] == null ? null : json["inbanner"],
        type: json["type"] == null ? null : json["type"],
        parent: json["parent"] == null ? null : json["parent"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
        resourceUrl: json["resource_url"] == null ? null : json["resource_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "slug": slug == null ? null : slug,
        "inhome": inhome == null ? null : inhome,
        "inbanner": inbanner == null ? null : inbanner,
        "type": type == null ? null : type,
        "parent": parent == null ? null : parent,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
        "resource_url": resourceUrl == null ? null : resourceUrl,
      };
}

class Category {
  int id;
  String slug;
  String title;
  List<Product> products;

  Category({
    this.id,
    this.slug,
    this.title,
    this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        slug: json["slug"] == null ? null : json["slug"],
        title: json["title"] == null ? null : json["title"],
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "slug": slug == null ? null : slug,
        "title": title == null ? null : title,
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  int id;
  String title;
  String slug;
  String image;
  double price;
  int quantity;
  int discount;
  String resourceUrl;
  double newPrice;
  String description;

  Product({
    this.id,
    this.title,
    this.slug,
    this.image,
    this.price,
    this.quantity,
    this.discount,
    this.resourceUrl,
    this.newPrice,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        image: json["image"] == null ? null : json["image"],
        price: json["price"] == null ? null : json["price"].toDouble,
        quantity: json["quantity"] == null ? null : json["quantity"],
        discount: json["discount"] == null ? null : json["discount"],
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
        "resource_url": resourceUrl == null ? null : resourceUrl,
        "newPrice": newPrice == null ? null : newPrice,
        "description": description == null ? null : description,
      };
}

class Slider {
  int id;
  String image;
  String url;
  int enabled;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String resourceUrl;

  Slider({
    this.id,
    this.image,
    this.url,
    this.enabled,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.resourceUrl,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
        url: json["url"],
        enabled: json["enabled"] == null ? null : json["enabled"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
        resourceUrl: json["resource_url"] == null ? null : json["resource_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "image": image == null ? null : image,
        "url": url,
        "enabled": enabled == null ? null : enabled,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "resource_url": resourceUrl == null ? null : resourceUrl,
      };
}

class HotDeals {
  int id;
  int productId;
  DateTime startAt;
  DateTime endAt;
  String resourceUrl;
  List<Product> products;

  HotDeals({
    this.id,
    this.productId,
    this.startAt,
    this.endAt,
    this.resourceUrl,
    this.products,
  });

  factory HotDeals.fromJson(Map<String, dynamic> json) => HotDeals(
        id: json["id"] == null ? null : json["id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        startAt:
            json["start_at"] == null ? null : DateTime.parse(json["start_at"]),
        endAt: json["end_at"] == null ? null : DateTime.parse(json["end_at"]),
        resourceUrl: json["resource_url"] == null ? null : json["resource_url"],
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "product_id": productId == null ? null : productId,
        "start_at": startAt == null ? null : startAt.toIso8601String(),
        "end_at": endAt == null ? null : endAt.toIso8601String(),
        "resource_url": resourceUrl == null ? null : resourceUrl,
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
