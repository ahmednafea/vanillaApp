class Brand {
  final String id;
  final String name;
  final String img;
  final String desc;
  final items item;

  const Brand({
    this.img,
    this.id,
    this.name,
    this.desc,
    this.item,
  });
}

class items {
  final String itemName;
  final String itemPrice;
  final String itemRatting;
  final String itemSale;
  final String itemId;
  final String itemImg;

  const items(
      {this.itemName,
      this.itemPrice,
      this.itemRatting,
      this.itemSale,
      this.itemId,
      this.itemImg});
}

List<Brand> brandData = [
  const Brand(
      name: "AMOUAGE",
      id: "1",
      img: "assets/imgBrand/brand1.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/img/img4.png",
          itemId: "1",
          itemName: "Amouage Dia",
          itemPrice: "\$ 40",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
  const Brand(
      name: "PARFUMS\nde MARLY",
      id: "2",
      img: "assets/imgBrand/brand2.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/img/img11.png",
          itemId: "1",
          itemName: "Delina",
          itemPrice: "\$ 33",
          itemRatting: "4.5",
          itemSale: "250 Sale")),
  const Brand(
      name: "SOSPIRO",
      id: "3",
      img: "assets/imgBrand/brand3.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/img/img8.png",
          itemId: "1",
          itemName: "Sospiro Ensemple",
          itemPrice: "\$ 40",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
  const Brand(
      name: "Gucci",
      id: "4",
      img: "assets/imgBrand/gucciHeader.png",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/img/img7.png",
          itemId: "1",
          itemName: "Gucci Guilty",
          itemPrice: "\$ 28",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
  const Brand(
      name: "LALIQUE",
      id: "5",
      img: "assets/imgBrand/brand4.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/img/img6.png",
          itemId: "1",
          itemName: "Reve d'infini",
          itemPrice: "\$ 80",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
  const Brand(
      name: "GIVENCHY",
      id: "6",
      img: "assets/imgBrand/brand5.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: items(
          itemImg: "assets/img/img2.png",
          itemId: "1",
          itemName: "Ysatis",
          itemPrice: "\$ 100",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
];
