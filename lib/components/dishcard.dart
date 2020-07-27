import 'package:flutter/material.dart';
import 'counter.dart';
import '../classes/dishes.dart';

class DishCard extends StatelessWidget {
  const DishCard({
    Key key,
    this.dish
  }) : super(key: key);

  final Dish dish;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10,10,10,10),
                child: CircleAvatar(
                  backgroundImage: displayImageSafely(dish.pictureUrl),
                  radius: 50,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      dish.name,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    dish.description,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Counter(),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                dish.price.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0,20,10,0),
                   child: FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add_shopping_cart,color: Colors.white,),
                    label: Text('Add to Cart',style: TextStyle(color: Colors.white),),
                    color: Colors.red,
              ),
                 )
            ],
          ),
        ],
      ),
    );
  }
}

ImageProvider displayImageSafely(String url)
{
  if(url == null){
    return AssetImage('assets/fallback.png');
  }
  else
    {
      return FadeInImage(placeholder: AssetImage('assets/loading.gif'),image: NetworkImage(url)).image;
    }
}