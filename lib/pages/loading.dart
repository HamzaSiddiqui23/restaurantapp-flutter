import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../classes/categories.dart';
import '../classes/api_manager.dart' as api;
import 'home.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  List<Category> categories = new List<Category>();

  void setupCategories() async {
    categories = await api.getCategories();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
        // Pass the arguments as part of the RouteSettings. The
        // DetailScreen reads the arguments from these settings.
        settings: RouteSettings(
          arguments: categories,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setupCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
