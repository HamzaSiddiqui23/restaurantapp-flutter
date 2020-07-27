import 'package:flutter/material.dart';
import '../components/dishcard.dart';
import '../classes/dishes.dart';
import '../classes/api_manager.dart' as api;

class DishPage extends StatefulWidget {
  final int categoryId;
  final String search;
  const DishPage ({ Key key, this.categoryId, this.search }): super(key: key);
  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {

  List<Dish> dishes = new List<Dish>();
  List<Dish> filteredDishes = new List<Dish>();
  void getDishesByCategory() async {
    List<Dish> temp = await api.getDishes(1.toString());
    setState(() {
      dishes = temp;
      filteredDishes = dishes;
    });
  }

  @override

  void didUpdateWidget(DishPage oldWidget) {
    if(oldWidget.categoryId != this.widget.categoryId) {
      getDishesByCategory();
    }
    if(this.widget.search!='') {
      filteredDishes = dishes.where((dish) => dish.name.toLowerCase().contains(this.widget.search.toLowerCase())).toList();
    }
    else if(this.widget.search=='')
      {
        filteredDishes = dishes;
      }
    super.didUpdateWidget(oldWidget);
  }

  void initState() {
    getDishesByCategory();
    super.initState();
  }
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filteredDishes.length,
      itemBuilder: (context,index){
        return DishCard(dish: filteredDishes[index],
        );
      },
    );
  }
}
