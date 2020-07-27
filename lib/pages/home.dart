import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../classes/categories.dart';
import '../components/dishcard.dart';
import '../classes/dishes.dart';
import '../classes/api_manager.dart' as api;
import '../components/dishes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isSearch = false;
  List<Category> categories = new List<Category>();
  String filterValue = '';

  void _filterDishes(value){
    setState(() {
      filterValue = value;
    });
  }

  void _clearFilter()
  {
    setState(() {
      filterValue = '';
    });
  }

  @override

  Widget build(BuildContext context) {
    categories = ModalRoute.of(context).settings.arguments;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      body: DefaultTabController(
        length: categories.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                title: !isSearch ? Text('China Terrace') :
                TextField(
                  onChanged: (value){
                    _filterDishes(value);
                  },
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white),
                    icon: Icon(Icons.search,color: Colors.white),
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.red,
                floating: true,
                pinned: false,
                snap: false,
                actions: <Widget>[
                  IconButton(icon: !isSearch ? Icon(Icons.search) : Icon(Icons.cancel),
                    onPressed: () {
                    setState(() {
                      if(this.isSearch) {
                        this._clearFilter();
                        }
                      this.isSearch = !this.isSearch;
                    });
                    },
                  )
                ],
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  tabs: categories.map((Category c) {
                    return Tab(
                        text: c.name,
                        icon: ImageIcon(
                          AssetImage('assets/fallback.png'),
                        )
                    );
                  }).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories.map((Category c)
            {
              return DishPage(categoryId: 1,search: filterValue);
            }).toList(),
          ),
        ),
      ),
    );
  }
}


