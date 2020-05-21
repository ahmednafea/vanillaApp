class Order {
  int orderId;
  OrderStatus orderStatus;
  DeliveryInfo deliveryInfo;
  List<OrderItem> orderItems;
  String orderNotes;
  DateTime dateCreatedUtc;
  int deliveryFee;

  Order({
    this.orderId,
    this.orderStatus,
    this.deliveryInfo,
    this.orderItems,
    this.orderNotes,
    this.dateCreatedUtc,
    this.deliveryFee,
  });
}

class DeliveryInfo {
  String deliverToName;
  String address;
  OrderStatus neighbourhood;
  String area;
  OrderStatus city;

  DeliveryInfo({
    this.deliverToName,
    this.address,
    this.neighbourhood,
    this.area,
    this.city,
  });
}

class OrderStatus {
  int id;
  String nameEnglish;
  String nameArabic;

  OrderStatus({
    this.id,
    this.nameEnglish,
    this.nameArabic,
  });
}

class OrderItem {
  int id;
  int productItemId;
  String productName;
  String nameEnglish;
  String nameArabic;
  int quantity;
  int price;

  OrderItem(
      {this.id,
      this.productItemId,
      this.productName,
      this.nameEnglish,
      this.nameArabic,
      this.quantity,
      this.price});
}
