class Dish{
  int id;
  String name;
  String description;
  double price;
  String pictureUrl;

  Dish({this.id,this.name,this.description,this.price,this.pictureUrl});

  factory Dish.fromJson(Map<String,dynamic> json){
    return Dish(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      pictureUrl: json['picture_url']
    );
  }
}