import 'package:http_auth/http_auth.dart';
import 'dart:convert';
import 'categories.dart';
import 'dishes.dart';

const API = 'https://diy-api.herokuapp.com/api/m1/';

Future<List<Category>> getCategories() async {
  List<Category> categories = List<Category>();
  try{
    var client = BasicAuthClient('apiuser', 'apipassword');
    var response = await client.get(API+'/categories');
    final cats = json.decode(response.body);
    for(int i = 0; i < cats.length; i++) {
        Category c = new Category(id: cats['categories'][i]['category']['id'],name: cats['categories'][i]['category']['name'], imageUrl: cats['categories'][i]['category']['image_url'], activeImageUrl: cats['categories'][i]['category']['active_image_url']);
        categories.add(c);
      }
    return categories;
  }
  catch (e)
  {
    print(e.toString());
    return categories;
  }
}

Future<List<Dish>> getDishes(String catId) async{
  List<Dish> dishes = List<Dish>();
  try {
    var client = BasicAuthClient('apiuser', 'apipassword');
    var response = await client.get(
        API + '/dishes?category_id=$catId');
    final cats = json.decode(response.body);
    for (int i = 0; i < cats['dishes'].length; i++) {
      dishes.add(Dish.fromJson(cats['dishes'][i][0]));
    }
  }
  catch (e)
  {
    print(e.toString());
  }
  return dishes;
}